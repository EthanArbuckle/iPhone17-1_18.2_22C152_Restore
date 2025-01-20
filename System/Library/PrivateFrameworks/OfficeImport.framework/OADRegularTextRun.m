@interface OADRegularTextRun
- (BOOL)isEmpty;
- (BOOL)isSimilarToTextRun:(id)a3;
- (OADRegularTextRun)init;
- (id)text;
- (unint64_t)characterCount;
@end

@implementation OADRegularTextRun

- (OADRegularTextRun)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADRegularTextRun;
  v2 = [(OADTextRun *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x263F089D8]);
    mText = v2->mText;
    v2->mText = v3;
  }
  return v2;
}

- (id)text
{
  return self->mText;
}

- (BOOL)isEmpty
{
  return [(NSMutableString *)self->mText length] == 0;
}

- (unint64_t)characterCount
{
  return [(NSMutableString *)self->mText length];
}

- (BOOL)isSimilarToTextRun:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OADRegularTextRun;
  if ([(OADTextRun *)&v9 isSimilarToTextRun:v4])
  {
    v5 = [(OADRegularTextRun *)self text];
    objc_super v6 = [v4 text];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end