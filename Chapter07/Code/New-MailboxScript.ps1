param(
  $name,
  $password,
  $upn,
  $alias,
  $first,
  $last
)

$pass = ConvertTo-SecureString -AsPlainText $password -Force

$mailbox = New-Mailbox -UserPrincipalName $upn `
-Alias $alias `
-Name "$first $last" `
-Password $pass `
-FirstName $first `
-LastName $last

Set-CasMailbox -Identity $mailbox `
-OWAEnabled $false `
-ActiveSyncEnabled $false `
-PopEnabled $false `
-ImapEnabled $false