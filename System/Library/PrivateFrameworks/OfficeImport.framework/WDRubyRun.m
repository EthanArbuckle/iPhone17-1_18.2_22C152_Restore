@interface WDRubyRun
- (WDRubyRun)initWithParagraph:(id)a3;
- (id)description;
- (id)phoneticRun;
- (id)phoneticRunString;
- (id)rubyProperties;
- (int)runType;
- (void)appendPhoneticRunString:(id)a3;
- (void)setPhoneticRunString:(id)a3;
@end

@implementation WDRubyRun

- (WDRubyRun)initWithParagraph:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WDRubyRun;
  v5 = [(WDCharacterRun *)&v11 initWithParagraph:v4];
  if (v5)
  {
    v6 = [[WDCharacterRun alloc] initWithParagraph:v4];
    mPhoneticRun = v5->mPhoneticRun;
    v5->mPhoneticRun = v6;

    v8 = objc_alloc_init(WDRubyProperties);
    mRubyProperties = v5->mRubyProperties;
    v5->mRubyProperties = v8;
  }
  return v5;
}

- (int)runType
{
  return 14;
}

- (id)rubyProperties
{
  return self->mRubyProperties;
}

- (id)phoneticRun
{
  return self->mPhoneticRun;
}

- (id)phoneticRunString
{
  return [(WDCharacterRun *)self->mPhoneticRun string];
}

- (void)setPhoneticRunString:(id)a3
{
}

- (void)appendPhoneticRunString:(id)a3
{
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDRubyRun;
  v2 = [(WDCharacterRun *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRubyProperties, 0);
  objc_storeStrong((id *)&self->mPhoneticRun, 0);
}

@end