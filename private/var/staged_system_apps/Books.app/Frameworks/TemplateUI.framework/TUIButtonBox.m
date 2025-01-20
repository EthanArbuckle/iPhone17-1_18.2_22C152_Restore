@interface TUIButtonBox
+ (id)_metricsForButtonType:(unint64_t)a3;
+ (unint64_t)buttonRoleFromString:(id)a3;
+ (unint64_t)buttonTypeFromString:(id)a3;
+ (void)setupSize;
- (Class)layoutClass;
- (NSArray)linkEntities;
- (NSDictionary)stateButtonAttributesMap;
- (unint64_t)buttonRole;
- (unint64_t)buttonType;
- (unint64_t)userInterfaceStyle;
- (void)setButtonRole:(unint64_t)a3;
- (void)setButtonType:(unint64_t)a3;
- (void)setLinkEntities:(id)a3;
- (void)setStateMap:(id)a3;
- (void)setUserInterfaceStyle:(unint64_t)a3;
@end

@implementation TUIButtonBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (void)setStateMap:(id)a3
{
  id v4 = a3;
  v19 = self;
  v24.receiver = self;
  v24.super_class = (Class)TUIButtonBox;
  [(TUIStatefulElementBox *)&v24 setStateMap:v4];
  v5 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v4 count]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v12 = objc_opt_class();
        v13 = [v6 objectForKeyedSubscript:v11];
        v14 = [v13 submodel];
        v15 = TUIDynamicCast(v12, v14);

        v16 = [v15 attributes];
        if (v16) {
          [v5 setObject:v16 forKeyedSubscript:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }

  id v17 = [v5 count];
  if (v17) {
    id v18 = [v5 copy];
  }
  else {
    id v18 = 0;
  }
  objc_storeStrong((id *)&v19->_stateButtonAttributesMap, v18);
  if (v17) {
}
  }

+ (void)setupSize
{
  id v2 = [a1 _metricsForButtonType:1];
}

+ (unint64_t)buttonTypeFromString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (qword_2DF7A8 != -1)
  {
    dispatch_once(&qword_2DF7A8, &stru_256360);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF7A0 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)buttonRoleFromString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (qword_2DF7B8 != -1)
  {
    dispatch_once(&qword_2DF7B8, &stru_256380);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF7B0 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (id)_metricsForButtonType:(unint64_t)a3
{
  if (qword_2DF7C8 != -1) {
    dispatch_once(&qword_2DF7C8, &stru_2563A0);
  }
  id v4 = (void *)qword_2DF7C0;
  v5 = +[NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (unint64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(unint64_t)a3
{
  self->_buttonType = a3;
}

- (unint64_t)buttonRole
{
  return self->_buttonRole;
}

- (void)setButtonRole:(unint64_t)a3
{
  self->_buttonRole = a3;
}

- (unint64_t)userInterfaceStyle
{
  return self->_userInterfaceStyle;
}

- (void)setUserInterfaceStyle:(unint64_t)a3
{
  self->_userInterfaceStyle = a3;
}

- (NSDictionary)stateButtonAttributesMap
{
  return self->_stateButtonAttributesMap;
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (void)setLinkEntities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);

  objc_storeStrong((id *)&self->_stateButtonAttributesMap, 0);
}

@end