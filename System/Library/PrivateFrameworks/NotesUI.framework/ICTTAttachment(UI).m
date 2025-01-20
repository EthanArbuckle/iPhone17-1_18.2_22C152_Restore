@interface ICTTAttachment(UI)
- (BOOL)embeddingType;
@end

@implementation ICTTAttachment(UI)

- (BOOL)embeddingType
{
  v2 = [a1 attachmentUTI];
  if ([v2 isEqualToString:*MEMORY[0x1E4F38E78]])
  {

    return 1;
  }
  v3 = [a1 attachmentUTI];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F38E80]];

  return v4 != 0;
}

@end