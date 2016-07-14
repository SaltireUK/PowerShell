Add-Type -AssemblyName System.Windows.Forms

$form = New-Object Windows.Forms.Form
$form.Size = New-Object Drawing.Size @(400,200)
$form.StartPosition = "CenterScreen"
$form.Text = "PowerShell-O365 GUI"

function LoadForm()
{
    $layout = New-Object "System.Windows.Forms.FlowLayoutPanel"
    $layout.FlowDirection = "TopDown"
    $layout.Dock = "Fill"
    $layout.Autosize = "True"

    $panel = New-Object "System.Windows.Forms.GroupBox"
    $panel.Text = "Show"
    $panel.AutoSize = "True"
    
    $flow = New-Object "System.Windows.Forms.FlowLayoutPanel"
    $flow.Dock = "Fill"
    $flow.AutoSize = "True"

    $btn = New-Object System.Windows.Forms.Button
    $btn.add_click({Connect-MsolService})
    $btn.Text = "Connect"
    $layout.Controls.Add($btn)

    $btn = New-Object System.Windows.Forms.Button
    $btn.add_click({Get-MsolUser|Out-GridView -Title "Users"})
    $btn.Text = "Users"

    $flow.Controls.Add($btn)

    $btn = New-Object System.Windows.Forms.Button
    $btn.add_click({Get-MsolGroup|Out-GridView -Title "Groups"})
    $btn.Text = "Groups"

    $flow.Controls.Add($btn)

    $btn = New-Object System.Windows.Forms.Button
    $btn.add_click({Get-MsolDomain|Out-GridView -Title "Registered Domains"})
    $btn.Text = "Domains"

    $flow.Controls.Add($btn)

    $panel.Controls.Add($flow)
    $layout.Controls.Add($panel)
    $form.Controls.Add($layout)

}


LoadForm

$drc = $form.ShowDialog()
