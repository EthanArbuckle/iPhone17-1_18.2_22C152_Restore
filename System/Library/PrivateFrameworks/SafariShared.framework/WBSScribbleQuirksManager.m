@interface WBSScribbleQuirksManager
- (WBSScribbleQuirksManager)init;
- (id)quirksForHighLevelDomain:(id)a3;
@end

@implementation WBSScribbleQuirksManager

- (WBSScribbleQuirksManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)WBSScribbleQuirksManager;
  v2 = [(WBSScribbleQuirksManager *)&v11 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v4 = [v3 URLForResource:@"ScribbleQuirks" withExtension:@"plist"];

    if (v4)
    {
      v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
      if ([v5 length])
      {
        uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9E8], "safari_dictionaryWithPropertyListData:options:", v5, 0);
        quirksDictionary = v2->_quirksDictionary;
        v2->_quirksDictionary = (NSDictionary *)v6;
      }
      v8 = v2;
    }
    else
    {
      v9 = v2;
    }
  }
  return v2;
}

- (id)quirksForHighLevelDomain:(id)a3
{
  id v4 = a3;
  if (-[NSDictionary count](self->_quirksDictionary, "count") && [v4 length])
  {
    v5 = [[WBSScribbleQuirks alloc] initWithHighLevelDomain:v4];
    uint64_t v6 = [(NSDictionary *)self->_quirksDictionary objectForKeyedSubscript:v4];
    v7 = objc_msgSend(v6, "safari_numberForKey:", @"shouldIgnorePointerEventsNone");
    [(WBSScribbleQuirks *)v5 setShouldIgnorePointerEventsNone:v7];

    v8 = objc_msgSend(v6, "safari_numberForKey:", @"shouldDisableHiddenActiveElement");
    [(WBSScribbleQuirks *)v5 setShouldDisableHiddenActiveElement:v8];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end