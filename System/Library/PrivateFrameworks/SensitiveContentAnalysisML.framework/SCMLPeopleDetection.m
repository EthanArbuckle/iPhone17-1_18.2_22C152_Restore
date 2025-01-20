@interface SCMLPeopleDetection
- (BOOL)hasAge;
- (BOOL)hasEthnicity;
- (BOOL)hasGender;
- (BOOL)hasGenericPeople;
- (BOOL)hasMultiplePeople;
- (NSArray)spans;
- (NSAttributedString)rewrittenText;
- (SCMLPeopleDetection)init;
- (void)setHasAge:(BOOL)a3;
- (void)setHasEthnicity:(BOOL)a3;
- (void)setHasGender:(BOOL)a3;
- (void)setHasGenericPeople:(BOOL)a3;
- (void)setHasMultiplePeople:(BOOL)a3;
- (void)setRewrittenText:(id)a3;
- (void)setSpans:(id)a3;
@end

@implementation SCMLPeopleDetection

- (SCMLPeopleDetection)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCMLPeopleDetection;
  v2 = [(SCMLPeopleDetection *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(SCMLPeopleDetection *)v2 setHasGenericPeople:0];
    [(SCMLPeopleDetection *)v3 setHasMultiplePeople:0];
    [(SCMLPeopleDetection *)v3 setHasGender:0];
    [(SCMLPeopleDetection *)v3 setHasEthnicity:0];
    [(SCMLPeopleDetection *)v3 setHasAge:0];
    [(SCMLPeopleDetection *)v3 setSpans:MEMORY[0x263EFFA68]];
    id v4 = objc_alloc_init(MEMORY[0x263F086A0]);
    [(SCMLPeopleDetection *)v3 setRewrittenText:v4];
  }
  return v3;
}

- (BOOL)hasGenericPeople
{
  return self->_hasGenericPeople;
}

- (void)setHasGenericPeople:(BOOL)a3
{
  self->_hasGenericPeople = a3;
}

- (BOOL)hasMultiplePeople
{
  return self->_hasMultiplePeople;
}

- (void)setHasMultiplePeople:(BOOL)a3
{
  self->_hasMultiplePeople = a3;
}

- (BOOL)hasGender
{
  return self->_hasGender;
}

- (void)setHasGender:(BOOL)a3
{
  self->_hasGender = a3;
}

- (BOOL)hasEthnicity
{
  return self->_hasEthnicity;
}

- (void)setHasEthnicity:(BOOL)a3
{
  self->_hasEthnicity = a3;
}

- (BOOL)hasAge
{
  return self->_hasAge;
}

- (void)setHasAge:(BOOL)a3
{
  self->_hasAge = a3;
}

- (NSArray)spans
{
  return self->_spans;
}

- (void)setSpans:(id)a3
{
}

- (NSAttributedString)rewrittenText
{
  return self->_rewrittenText;
}

- (void)setRewrittenText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenText, 0);

  objc_storeStrong((id *)&self->_spans, 0);
}

@end