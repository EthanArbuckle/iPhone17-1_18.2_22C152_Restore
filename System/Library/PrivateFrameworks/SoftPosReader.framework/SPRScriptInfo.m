@interface SPRScriptInfo
- (NSString)scriptName;
- (SPRScriptInfo)initWithScriptID:(unint64_t)a3 scriptName:(id)a4 apduCount:(unsigned int)a5;
- (unint64_t)scriptID;
- (unsigned)apduCount;
@end

@implementation SPRScriptInfo

- (SPRScriptInfo)initWithScriptID:(unint64_t)a3 scriptName:(id)a4 apduCount:(unsigned int)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SPRScriptInfo;
  v10 = [(SPRScriptInfo *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_scriptID = a3;
    objc_storeStrong((id *)&v10->_scriptName, a4);
    v11->_apduCount = a5;
  }

  return v11;
}

- (unint64_t)scriptID
{
  return self->_scriptID;
}

- (NSString)scriptName
{
  return self->_scriptName;
}

- (unsigned)apduCount
{
  return self->_apduCount;
}

- (void).cxx_destruct
{
}

@end