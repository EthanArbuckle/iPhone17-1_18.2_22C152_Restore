@interface ICAttachmentPaperDocumentModel
+ (int64_t)baseNotesVersion;
- (BOOL)supportsQuickLook;
- (id)additionalIndexableTextContentInNote;
- (unint64_t)paperPageCount;
- (void)setPaperPageCount:(unint64_t)a3;
@end

@implementation ICAttachmentPaperDocumentModel

+ (int64_t)baseNotesVersion
{
  return 13;
}

- (id)additionalIndexableTextContentInNote
{
  v2 = [(ICAttachmentModel *)self attachment];
  v3 = [v2 additionalIndexableText];

  return v3;
}

- (unint64_t)paperPageCount
{
  v2 = [(ICAttachmentModel *)self attachment];
  v3 = [v2 metadata];
  v4 = [v3 objectForKeyedSubscript:@"paperPageCount"];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (void)setPaperPageCount:(unint64_t)a3
{
  unint64_t v5 = [(ICAttachmentModel *)self attachment];
  v6 = [v5 metadata];
  v7 = (void *)[v6 mutableCopy];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  id v13 = v9;

  v10 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [v13 setObject:v10 forKeyedSubscript:@"paperPageCount"];

  v11 = (void *)[v13 copy];
  v12 = [(ICAttachmentModel *)self attachment];
  [v12 setMetadata:v11];
}

- (BOOL)supportsQuickLook
{
  return 1;
}

@end