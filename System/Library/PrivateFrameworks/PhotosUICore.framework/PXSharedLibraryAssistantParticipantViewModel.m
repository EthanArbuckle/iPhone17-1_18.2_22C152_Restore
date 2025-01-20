@interface PXSharedLibraryAssistantParticipantViewModel
- (NSString)subtitle;
- (NSString)title;
- (PXSharedLibraryAssistantParticipantViewModel)init;
- (UIImage)image;
- (void)performChanges:(id)a3;
- (void)setImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PXSharedLibraryAssistantParticipantViewModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (void)performChanges:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryAssistantParticipantViewModel;
  [(PXSharedLibraryAssistantParticipantViewModel *)&v3 performChanges:a3];
}

- (void)setSubtitle:(id)a3
{
  v11 = (NSString *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantParticipantViewModel.m", 46, @"Invalid parameter not satisfying: %@", @"subtitle" object file lineNumber description];
  }
  v5 = self->_subtitle;
  if (v5 == v11)
  {
  }
  else
  {
    v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v11];

    if (!v7)
    {
      v8 = (NSString *)[(NSString *)v11 copy];
      subtitle = self->_subtitle;
      self->_subtitle = v8;

      [(PXSharedLibraryAssistantParticipantViewModel *)self signalChange:4];
    }
  }
}

- (void)setTitle:(id)a3
{
  v11 = (NSString *)a3;
  if (!v11)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantParticipantViewModel.m", 38, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  v5 = self->_title;
  if (v5 == v11)
  {
  }
  else
  {
    v6 = v5;
    BOOL v7 = [(NSString *)v5 isEqualToString:v11];

    if (!v7)
    {
      v8 = (NSString *)[(NSString *)v11 copy];
      title = self->_title;
      self->_title = v8;

      [(PXSharedLibraryAssistantParticipantViewModel *)self signalChange:2];
    }
  }
}

- (void)setImage:(id)a3
{
  v8 = (UIImage *)a3;
  v4 = self->_image;
  if (v4 == v8)
  {
  }
  else
  {
    char v5 = [(UIImage *)v4 isEqual:v8];

    if ((v5 & 1) == 0)
    {
      v6 = (UIImage *)[(UIImage *)v8 copy];
      image = self->_image;
      self->_image = v6;

      [(PXSharedLibraryAssistantParticipantViewModel *)self signalChange:1];
    }
  }
}

- (PXSharedLibraryAssistantParticipantViewModel)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryAssistantParticipantViewModel;
  v2 = [(PXSharedLibraryAssistantParticipantViewModel *)&v7 init];
  objc_super v3 = v2;
  if (v2)
  {
    title = v2->_title;
    v2->_title = (NSString *)&stru_1F00B0030;

    subtitle = v3->_subtitle;
    v3->_subtitle = (NSString *)&stru_1F00B0030;
  }
  return v3;
}

@end