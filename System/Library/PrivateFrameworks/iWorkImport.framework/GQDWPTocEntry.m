@interface GQDWPTocEntry
- (__CFString)bookmark;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
- (void)dealloc;
@end

@implementation GQDWPTocEntry

- (void)dealloc
{
  mBookmark = self->mBookmark;
  if (mBookmark) {
    CFRelease(mBookmark);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPTocEntry;
  [(GQDWPBlockList *)&v4 dealloc];
}

- (__CFString)bookmark
{
  return self->mBookmark;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  v5 = (__CFString *)sub_4340C(a3, qword_A35E8, (xmlChar *)"bookmark");
  self->mBookmark = v5;
  if (v5) {
    return 1;
  }
  else {
    return 3;
  }
}

@end