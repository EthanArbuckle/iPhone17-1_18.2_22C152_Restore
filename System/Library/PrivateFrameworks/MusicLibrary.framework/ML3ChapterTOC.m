@interface ML3ChapterTOC
- (ML3ChapterTOC)initWithChapterDataRef:(ChapterData *)a3 track:(id)a4;
@end

@implementation ML3ChapterTOC

- (void).cxx_destruct
{
}

- (ML3ChapterTOC)initWithChapterDataRef:(ChapterData *)a3 track:(id)a4
{
  id v7 = a4;
  v8 = [v7 valueForProperty:@"item_extra.total_time_ms"];
  v11.receiver = self;
  v11.super_class = (Class)ML3ChapterTOC;
  v9 = -[MLITChapterTOC initWithChapterDataRef:totalTimeInMS:](&v11, sel_initWithChapterDataRef_totalTimeInMS_, a3, [v8 unsignedIntValue]);

  if (v9) {
    objc_storeStrong((id *)&v9->_track, a4);
  }

  return v9;
}

@end