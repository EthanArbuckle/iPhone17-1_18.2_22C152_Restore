@interface OADTextField
- (BOOL)isEmpty;
- (OADTextField)init;
- (id)paragraphProperties;
- (id)text;
- (unint64_t)characterCount;
- (void)removeUnnecessaryOverrides;
- (void)setText:(id)a3;
@end

@implementation OADTextField

- (OADTextField)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADTextField;
  v2 = [(OADTextRun *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(OADParagraphProperties);
    mParagraphProperties = v2->mParagraphProperties;
    v2->mParagraphProperties = v3;
  }
  return v2;
}

- (void)setText:(id)a3
{
}

- (void)removeUnnecessaryOverrides
{
  [(OADParagraphProperties *)self->mParagraphProperties removeUnnecessaryOverrides];
  v3.receiver = self;
  v3.super_class = (Class)OADTextField;
  [(OADTextRun *)&v3 removeUnnecessaryOverrides];
}

- (id)text
{
  return self->mText;
}

- (BOOL)isEmpty
{
  return 0;
}

- (id)paragraphProperties
{
  return self->mParagraphProperties;
}

- (unint64_t)characterCount
{
  return [(NSString *)self->mText length];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mParagraphProperties, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end