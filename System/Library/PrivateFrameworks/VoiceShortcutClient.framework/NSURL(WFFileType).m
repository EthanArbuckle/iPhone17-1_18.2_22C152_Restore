@interface NSURL(WFFileType)
- (id)wfFileType;
@end

@implementation NSURL(WFFileType)

- (id)wfFileType
{
  if (![a1 isFileURL]
    || (uint64_t v5 = 0,
        [a1 getResourceValue:&v5 forKey:*MEMORY[0x1E4F1C728] error:0],
        +[WFFileType typeWithString:v5],
        (v2 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = [a1 lastPathComponent];
    v2 = +[WFFileType typeFromFilename:v3];
  }
  return v2;
}

@end