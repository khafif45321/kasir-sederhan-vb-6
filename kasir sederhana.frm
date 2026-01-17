VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00C0C000&
   Caption         =   "Form1"
   ClientHeight    =   5010
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   7875
   ForeColor       =   &H8000000B&
   LinkTopic       =   "Form1"
   Picture         =   "kasir sederhana.frx":0000
   ScaleHeight     =   5010
   ScaleWidth      =   7875
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdkembali 
      Caption         =   "Kembali"
      Height          =   495
      Left            =   5280
      TabIndex        =   8
      Top             =   3480
      Width           =   1215
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   495
      Left            =   3720
      TabIndex        =   7
      Top             =   3240
      Width           =   1215
   End
   Begin VB.CommandButton cmdhitung 
      Caption         =   "Hitung"
      Height          =   495
      Left            =   2040
      TabIndex        =   6
      Top             =   3240
      Width           =   1215
   End
   Begin VB.TextBox txtBayar 
      Height          =   495
      Left            =   2760
      TabIndex        =   3
      Top             =   2280
      Width           =   1215
   End
   Begin VB.TextBox txtQty 
      Height          =   495
      Left            =   3000
      TabIndex        =   2
      Top             =   1560
      Width           =   1215
   End
   Begin VB.TextBox txtHarga 
      Height          =   495
      Left            =   3120
      TabIndex        =   1
      Top             =   960
      Width           =   1215
   End
   Begin VB.TextBox txtBarang 
      Height          =   495
      Left            =   3240
      TabIndex        =   0
      Top             =   360
      Width           =   1215
   End
   Begin VB.Label lblTotal 
      Caption         =   "Total"
      Height          =   495
      Left            =   1320
      TabIndex        =   5
      Top             =   2640
      Width           =   1215
   End
   Begin VB.Label lblKembali 
      Caption         =   "Kembalian:"
      Height          =   495
      Left            =   1320
      TabIndex        =   4
      Top             =   2160
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdClear_Click()
    txtBarang.Text = ""
    txtHarga.Text = ""
    txtQty.Text = ""
    txtBayar.Text = ""
    lblTotal.Caption = "Total: 0"
    lblKembali.Caption = "Kembalian: 0"
    txtBarang.SetFocus
End Sub
Private Sub cmdHitung_Click()
    Dim harga As Double
    Dim qty As Integer
    Dim total As Double
    Dim bayar As Double
    Dim kembali As Double

    ' Validasi input
    If txtBarang.Text = "" Or txtHarga.Text = "" Or txtQty.Text = "" Then
        MsgBox "Input tidak boleh kosong!", vbExclamation, "Peringatan"
        Exit Sub
    End If

    ' Ambil nilai
    harga = Val(txtHarga.Text)
    qty = Val(txtQty.Text)

    ' Hitung total belanja
    total = harga * qty
    lblTotal.Caption = "Total: " & total

    ' Hitung kembalian jika uang bayar diisi
    If txtBayar.Text <> "" Then
        bayar = Val(txtBayar.Text)
        kembali = bayar - total

        If kembali < 0 Then
            lblKembali.Caption = "Kembalian: Uang kurang!"
        Else
            lblKembali.Caption = "Kembalian: " & kembali
        End If
    End If
End Sub
Private Sub cmdKembali_Click()
    Dim total As Double
    Dim bayar As Double
    Dim kembali As Double

    ' Ambil nilai
    total = Val(txtTotal.Text)
    bayar = Val(txtBayar.Text)

    ' Validasi uang bayar
    If bayar < total Then
        MsgBox "Uang bayar kurang!", vbExclamation, "Peringatan"
        lblKembalian.Caption = "Kembalian: 0"
        Exit Sub
    End If

    ' Hitung kembalian
    kembali = bayar - total

    ' Tampilkan hasil
    lblKembalian.Caption = "Kembalian: " & kembali
End Sub

