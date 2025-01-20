@interface GQDWPText
- (BOOL)isBlank;
- (GQDWPText)initWithContent:(const char *)a3;
- (const)content;
- (void)dealloc;
@end

@implementation GQDWPText

- (GQDWPText)initWithContent:(const char *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GQDWPText;
  v4 = [(GQDWPText *)&v7 init];
  v5 = v4;
  if (a3 && v4) {
    v4->mContent = (char *)xmlStrdup((const xmlChar *)a3);
  }
  return v5;
}

- (void)dealloc
{
  mContent = self->mContent;
  if (mContent) {
    xmlFree(mContent);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQDWPText;
  [(GQDWPText *)&v4 dealloc];
}

- (const)content
{
  return self->mContent;
}

- (BOOL)isBlank
{
  mContent = self->mContent;
  if (!mContent || !*mContent) {
    return 1;
  }
  unint64_t v3 = 0;
  BOOL v4 = 1;
  while (1)
  {
    int v5 = mContent[v3];
    if (v5 != 32) {
      break;
    }
    BOOL v4 = v3++ < 0x31;
    if (v3 == 50)
    {
      BOOL v6 = 1;
      return v4 && v6;
    }
  }
  BOOL v6 = v5 == 0;
  return v4 && v6;
}

@end