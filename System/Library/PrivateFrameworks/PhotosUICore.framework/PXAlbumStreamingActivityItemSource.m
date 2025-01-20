@interface PXAlbumStreamingActivityItemSource
- (PLCloudSharedAlbum)album;
- (PXAlbumStreamingActivityItemSource)initWithAlbum:(id)a3;
- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItems:(id)a3;
- (id)activityViewControllerSubject:(id)a3;
@end

@implementation PXAlbumStreamingActivityItemSource

- (void).cxx_destruct
{
}

- (PLCloudSharedAlbum)album
{
  return self->_album;
}

- (id)activityViewControllerSubject:(id)a3
{
  v3 = [(PXAlbumStreamingActivityItemSource *)self album];
  v4 = [v3 localizedTitle];

  v5 = PLServicesLocalizedFrameworkString();
  v6 = PXStringWithValidatedFormat();

  return v6;
}

- (id)activityViewController:(id)a3 thumbnailForActivityType:(id)a4
{
  v4 = [(PXAlbumStreamingActivityItemSource *)self album];
  v5 = [v4 posterImage];

  return v5;
}

- (id)activityViewController:(id)a3 itemsForActivityType:(id)a4
{
  id v5 = a4;
  v6 = [(PXAlbumStreamingActivityItemSource *)self album];
  v7 = [v6 localizedTitle];
  v8 = (void *)MEMORY[0x1E4F1CB10];
  v9 = [v6 publicURL];
  v10 = [v8 URLWithString:v9];

  if ([v5 isEqualToString:*MEMORY[0x1E4F9F370]])
  {
    v11 = NSString;
    v12 = PLServicesLocalizedFrameworkString();
    v13 = (__CFString *)[v7 mutableCopy];
    if (CFStringTransform(v13, 0, @"Any-Hex/XML", 0)) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }

    v15 = [v11 stringWithFormat:@"<html><p>%@</p><p><a href=\"%@\">%@</a></p></html>", v12, v10, v14];

    v18 = [MEMORY[0x1E4F1C978] arrayWithObject:v15];
    goto LABEL_12;
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F9F380]])
  {
    v15 = PLServicesLocalizedFrameworkString();
    v16 = PXStringWithValidatedFormat();
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", v16, v7, v10);
LABEL_9:
    v18 = (void *)v17;

LABEL_12:
    goto LABEL_13;
  }
  if (([v5 isEqualToString:*MEMORY[0x1E4F9F390]] & 1) != 0
    || [v5 isEqualToString:*MEMORY[0x1E4F9F3B8]])
  {
    v15 = PLServicesLocalizedFrameworkString();
    v16 = PXStringWithValidatedFormat();
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v16, v10, 0);
    goto LABEL_9;
  }
  v18 = [MEMORY[0x1E4F1C978] arrayWithObject:v10];
LABEL_13:

  return v18;
}

- (id)activityViewControllerPlaceholderItems:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(PXAlbumStreamingActivityItemSource *)self album];
  v4 = [v3 localizedTitle];
  id v5 = [v3 publicURL];
  if (v5) {
    v6 = v5;
  }
  else {
    v6 = @"https://www.icloud.com/sharedalbum/#";
  }
  v7 = [MEMORY[0x1E4F1CB10] URLWithString:v6];
  v10[0] = v4;
  v10[1] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  return v8;
}

- (PXAlbumStreamingActivityItemSource)initWithAlbum:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXAlbumStreamingActivityItemSource;
  v7 = [(PXAlbumStreamingActivityItemSource *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:v7 file:@"PXAlbumStreamingUtilities.m" lineNumber:45 description:@"Missing album for PXAlbumStreamingActivityItemSource"];
    }
    objc_storeStrong((id *)&v7->_album, a3);
  }

  return v7;
}

@end