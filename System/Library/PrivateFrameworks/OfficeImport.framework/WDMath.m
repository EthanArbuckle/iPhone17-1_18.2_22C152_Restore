@interface WDMath
- (NSString)xmlBlob;
- (WDCharacterProperties)properties;
- (WDMath)initWithParagraph:(id)a3 xmlBlob:(id)a4;
- (id)description;
- (int)justification;
- (int)runType;
- (void)clearProperties;
- (void)setJustification:(int)a3;
- (void)setProperties:(id)a3;
@end

@implementation WDMath

- (WDMath)initWithParagraph:(id)a3 xmlBlob:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WDMath;
  v8 = [(WDRun *)&v13 initWithParagraph:v6];
  v9 = v8;
  if (v8)
  {
    v8->_justification = 0;
    uint64_t v10 = [v7 copy];
    xmlBlob = v9->_xmlBlob;
    v9->_xmlBlob = (NSString *)v10;
  }
  return v9;
}

- (int)runType
{
  return 15;
}

- (void)clearProperties
{
  properties = self->_properties;
  self->_properties = 0;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)WDMath;
  v2 = [(WDRun *)&v4 description];
  return v2;
}

- (int)justification
{
  return self->_justification;
}

- (void)setJustification:(int)a3
{
  self->_justification = a3;
}

- (WDCharacterProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (NSString)xmlBlob
{
  return self->_xmlBlob;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmlBlob, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end