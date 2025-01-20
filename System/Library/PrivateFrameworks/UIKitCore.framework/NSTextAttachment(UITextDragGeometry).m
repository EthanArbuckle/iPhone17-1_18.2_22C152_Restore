@interface NSTextAttachment(UITextDragGeometry)
+ (id)_imageFromAttachment:()UITextDragGeometry;
+ (uint64_t)_attachmentHasImage:()UITextDragGeometry;
@end

@implementation NSTextAttachment(UITextDragGeometry)

+ (uint64_t)_attachmentHasImage:()UITextDragGeometry
{
  id v3 = a3;
  v4 = [v3 image];

  if (!v4)
  {
    uint64_t v6 = [v3 fileType];
    if (v6)
    {
      v7 = (void *)v6;
      uint64_t v5 = [v3 fileWrapper];
      if (!v5)
      {
LABEL_7:

        goto LABEL_9;
      }
      v8 = [v3 fileWrapper];
      int v9 = [v8 isRegularFile];

      if (v9)
      {
        v7 = +[UIImage readableTypeIdentifiersForItemProvider];
        v10 = [v3 fileType];
        uint64_t v5 = [v7 containsObject:v10];

        goto LABEL_7;
      }
    }
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = 1;
LABEL_9:

  return v5;
}

+ (id)_imageFromAttachment:()UITextDragGeometry
{
  id v3 = a3;
  v4 = [v3 image];

  if (v4)
  {
    uint64_t v5 = [v3 image];
    goto LABEL_11;
  }
  uint64_t v5 = [v3 fileType];
  if (v5)
  {
    uint64_t v6 = [v3 fileWrapper];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = [v3 fileWrapper];
      if ([v8 isRegularFile])
      {
        int v9 = +[UIImage readableTypeIdentifiersForItemProvider];
        v10 = [v3 fileType];
        int v11 = [v9 containsObject:v10];

        if (v11)
        {
          v12 = [v3 fileWrapper];
          v13 = [v12 regularFileContents];
          uint64_t v5 = +[UIImage imageWithData:v13];

          goto LABEL_11;
        }
        goto LABEL_10;
      }
    }
LABEL_10:
    uint64_t v5 = 0;
  }
LABEL_11:

  return v5;
}

@end