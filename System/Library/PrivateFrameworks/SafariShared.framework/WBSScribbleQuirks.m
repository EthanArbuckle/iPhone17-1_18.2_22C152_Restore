@interface WBSScribbleQuirks
- (NSNumber)shouldDisableHiddenActiveElement;
- (NSNumber)shouldIgnorePointerEventsNone;
- (NSString)highLevelDomain;
- (WBSScribbleQuirks)initWithHighLevelDomain:(id)a3;
- (void)setShouldDisableHiddenActiveElement:(id)a3;
- (void)setShouldIgnorePointerEventsNone:(id)a3;
@end

@implementation WBSScribbleQuirks

- (WBSScribbleQuirks)initWithHighLevelDomain:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSScribbleQuirks;
  v6 = [(WBSScribbleQuirks *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_highLevelDomain, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)highLevelDomain
{
  return self->_highLevelDomain;
}

- (NSNumber)shouldIgnorePointerEventsNone
{
  return self->_shouldIgnorePointerEventsNone;
}

- (void)setShouldIgnorePointerEventsNone:(id)a3
{
}

- (NSNumber)shouldDisableHiddenActiveElement
{
  return self->_shouldDisableHiddenActiveElement;
}

- (void)setShouldDisableHiddenActiveElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shouldDisableHiddenActiveElement, 0);
  objc_storeStrong((id *)&self->_shouldIgnorePointerEventsNone, 0);
  objc_storeStrong((id *)&self->_highLevelDomain, 0);
}

@end