@interface GQDWPBookmark
- (BOOL)isHidden;
- (BOOL)isRanged;
- (__CFString)name;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
- (void)dealloc;
@end

@implementation GQDWPBookmark

- (void)dealloc
{
  mName = self->mName;
  if (mName) {
    CFRelease(mName);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPBookmark;
  [(GQDWPTextList *)&v4 dealloc];
}

- (__CFString)name
{
  return self->mName;
}

- (BOOL)isRanged
{
  return self->mRanged;
}

- (BOOL)isHidden
{
  return self->mHidden;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  self->mName = (__CFString *)sub_4340C(a3, qword_A35E8, (xmlChar *)"name");
  self->mRanged = sub_42DCC(a3, qword_A35E8, (xmlChar *)"ranged", 0);
  self->mHidden = sub_42DCC(a3, qword_A35E8, (xmlChar *)"hidden", 0);
  return 1;
}

@end