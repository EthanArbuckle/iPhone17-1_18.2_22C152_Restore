@interface PXCMMInvitationViewModel
- (BOOL)isHighlighted;
- (BOOL)isNew;
- (NSAttributedString)attributedPosterTitle;
- (NSAttributedString)attributedSubtitle1;
- (NSAttributedString)attributedSubtitle2;
- (NSAttributedString)attributedTitle;
- (NSString)posterSubtitle;
- (NSString)posterTitle;
- (PXCMMInvitationParticipant)owner;
- (PXCMMInvitationViewModel)init;
- (PXDisplayAsset)posterAsset;
- (PXUIImageProvider)posterMediaProvider;
- (UIColor)opaqueAncestorBackgroundColor;
- (void)performChanges:(id)a3;
- (void)setAttributedPosterTitle:(id)a3;
- (void)setAttributedSubtitle1:(id)a3;
- (void)setAttributedSubtitle2:(id)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsNew:(BOOL)a3;
- (void)setOpaqueAncestorBackgroundColor:(id)a3;
- (void)setOwner:(id)a3;
- (void)setPosterAsset:(id)a3;
- (void)setPosterMediaProvider:(id)a3;
- (void)setPosterSubtitle:(id)a3;
- (void)setPosterTitle:(id)a3;
@end

@implementation PXCMMInvitationViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opaqueAncestorBackgroundColor, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle2, 0);
  objc_storeStrong((id *)&self->_attributedSubtitle1, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_attributedPosterTitle, 0);
  objc_storeStrong((id *)&self->_posterMediaProvider, 0);
  objc_storeStrong((id *)&self->_posterAsset, 0);
  objc_storeStrong((id *)&self->_posterSubtitle, 0);
  objc_storeStrong((id *)&self->_posterTitle, 0);
  objc_storeStrong((id *)&self->_owner, 0);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIColor)opaqueAncestorBackgroundColor
{
  return self->_opaqueAncestorBackgroundColor;
}

- (NSAttributedString)attributedSubtitle2
{
  return self->_attributedSubtitle2;
}

- (NSAttributedString)attributedSubtitle1
{
  return self->_attributedSubtitle1;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (NSAttributedString)attributedPosterTitle
{
  return self->_attributedPosterTitle;
}

- (PXUIImageProvider)posterMediaProvider
{
  return self->_posterMediaProvider;
}

- (PXDisplayAsset)posterAsset
{
  return self->_posterAsset;
}

- (NSString)posterSubtitle
{
  return self->_posterSubtitle;
}

- (NSString)posterTitle
{
  return self->_posterTitle;
}

- (PXCMMInvitationParticipant)owner
{
  return self->_owner;
}

- (BOOL)isNew
{
  return self->_isNew;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(PXCMMInvitationViewModel *)self signalChange:512];
  }
}

- (void)setOpaqueAncestorBackgroundColor:(id)a3
{
  v10 = (UIColor *)a3;
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCMMInvitationViewModel.m", 173, @"Invalid parameter not satisfying: %@", @"opaqueAncestorBackgroundColor" object file lineNumber description];
  }
  v6 = self->_opaqueAncestorBackgroundColor;
  if (v6 == v10)
  {
  }
  else
  {
    v7 = v6;
    char v8 = [(UIColor *)v6 isEqual:v10];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_opaqueAncestorBackgroundColor, a3);
      [(PXCMMInvitationViewModel *)self signalChange:256];
    }
  }
}

- (void)setAttributedSubtitle2:(id)a3
{
  char v8 = (NSAttributedString *)a3;
  v4 = self->_attributedSubtitle2;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSAttributedString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)[(NSAttributedString *)v8 copy];
      attributedSubtitle2 = self->_attributedSubtitle2;
      self->_attributedSubtitle2 = v6;

      [(PXCMMInvitationViewModel *)self signalChange:128];
    }
  }
}

- (void)setAttributedSubtitle1:(id)a3
{
  char v8 = (NSAttributedString *)a3;
  v4 = self->_attributedSubtitle1;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSAttributedString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)[(NSAttributedString *)v8 copy];
      attributedSubtitle1 = self->_attributedSubtitle1;
      self->_attributedSubtitle1 = v6;

      [(PXCMMInvitationViewModel *)self signalChange:64];
    }
  }
}

- (void)setAttributedTitle:(id)a3
{
  char v8 = (NSAttributedString *)a3;
  v4 = self->_attributedTitle;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSAttributedString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)[(NSAttributedString *)v8 copy];
      attributedTitle = self->_attributedTitle;
      self->_attributedTitle = v6;

      [(PXCMMInvitationViewModel *)self signalChange:32];
    }
  }
}

- (void)setAttributedPosterTitle:(id)a3
{
  char v8 = (NSAttributedString *)a3;
  v4 = self->_attributedPosterTitle;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(NSAttributedString *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (NSAttributedString *)[(NSAttributedString *)v8 copy];
      attributedPosterTitle = self->_attributedPosterTitle;
      self->_attributedPosterTitle = v6;

      [(PXCMMInvitationViewModel *)self signalChange:2];
    }
  }
}

- (void)setPosterMediaProvider:(id)a3
{
  char v5 = (PXUIImageProvider *)a3;
  if (self->_posterMediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_posterMediaProvider, a3);
    [(PXCMMInvitationViewModel *)self signalChange:16];
    char v5 = v6;
  }
}

- (void)setPosterAsset:(id)a3
{
  char v5 = (PXDisplayAsset *)a3;
  if (self->_posterAsset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_posterAsset, a3);
    [(PXCMMInvitationViewModel *)self signalChange:8];
    char v5 = v6;
  }
}

- (void)setPosterSubtitle:(id)a3
{
  v10 = (NSString *)a3;
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCMMInvitationViewModel.m", 109, @"Invalid parameter not satisfying: %@", @"posterSubtitle" object file lineNumber description];
  }
  char v5 = self->_posterSubtitle;
  if (v5 == v10)
  {
  }
  else
  {
    BOOL v6 = [(NSString *)v10 isEqualToString:v5];

    if (!v6)
    {
      v7 = (NSString *)[(NSString *)v10 copy];
      posterSubtitle = self->_posterSubtitle;
      self->_posterSubtitle = v7;

      [(PXCMMInvitationViewModel *)self signalChange:4];
    }
  }
}

- (void)setPosterTitle:(id)a3
{
  v10 = (NSString *)a3;
  if (!v10)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PXCMMInvitationViewModel.m", 99, @"Invalid parameter not satisfying: %@", @"posterTitle" object file lineNumber description];
  }
  char v5 = self->_posterTitle;
  if (v5 == v10)
  {
  }
  else
  {
    BOOL v6 = [(NSString *)v10 isEqualToString:v5];

    if (!v6)
    {
      v7 = (NSString *)[(NSString *)v10 copy];
      posterTitle = self->_posterTitle;
      self->_posterTitle = v7;

      [(PXCMMInvitationViewModel *)self signalChange:2];
    }
  }
}

- (void)setOwner:(id)a3
{
  char v5 = (PXCMMInvitationParticipant *)a3;
  if (self->_owner != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_owner, a3);
    [(PXCMMInvitationViewModel *)self signalChange:1024];
    char v5 = v6;
  }
}

- (void)setIsNew:(BOOL)a3
{
  if (self->_isNew != a3)
  {
    self->_isNew = a3;
    [(PXCMMInvitationViewModel *)self signalChange:1];
  }
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXCMMInvitationViewModel;
  [(PXCMMInvitationViewModel *)&v3 performChanges:a3];
}

- (PXCMMInvitationViewModel)init
{
  v9.receiver = self;
  v9.super_class = (Class)PXCMMInvitationViewModel;
  v2 = [(PXCMMInvitationViewModel *)&v9 init];
  objc_super v3 = v2;
  if (v2)
  {
    posterTitle = v2->_posterTitle;
    v2->_posterTitle = (NSString *)&stru_1F00B0030;

    posterSubtitle = v3->_posterSubtitle;
    v3->_posterSubtitle = (NSString *)&stru_1F00B0030;

    uint64_t v6 = [MEMORY[0x1E4FB1618] clearColor];
    opaqueAncestorBackgroundColor = v3->_opaqueAncestorBackgroundColor;
    v3->_opaqueAncestorBackgroundColor = (UIColor *)v6;
  }
  return v3;
}

@end