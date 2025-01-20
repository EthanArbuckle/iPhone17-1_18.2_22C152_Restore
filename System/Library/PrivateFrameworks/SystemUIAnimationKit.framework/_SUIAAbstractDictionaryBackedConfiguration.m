@interface _SUIAAbstractDictionaryBackedConfiguration
- (_SUIAAbstractDictionaryBackedConfiguration)init;
- (double)delayForApplicationOfKeypath:(id)a3;
- (id)behaviorSettingsForKeypath:(id)a3;
- (void)_setBehaviorSettings:(id)a3 forKeypath:(id)a4;
- (void)_setDelay:(double)a3 forApplicationOfKeypath:(id)a4;
@end

@implementation _SUIAAbstractDictionaryBackedConfiguration

- (_SUIAAbstractDictionaryBackedConfiguration)init
{
  v10.receiver = self;
  v10.super_class = (Class)_SUIAAbstractDictionaryBackedConfiguration;
  v2 = [(_SUIAAbstractDictionaryBackedConfiguration *)&v10 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    propertyDictionary = v2->_propertyDictionary;
    v2->_propertyDictionary = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    behaviorSettingsDictionary = v2->_behaviorSettingsDictionary;
    v2->_behaviorSettingsDictionary = (NSMutableDictionary *)v5;

    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
    delayDictionary = v2->_delayDictionary;
    v2->_delayDictionary = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)_setBehaviorSettings:(id)a3 forKeypath:(id)a4
{
  behaviorSettingsDictionary = self->_behaviorSettingsDictionary;
  if (a3) {
    [(NSMutableDictionary *)behaviorSettingsDictionary setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)behaviorSettingsDictionary removeObjectForKey:a4];
  }
}

- (id)behaviorSettingsForKeypath:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_behaviorSettingsDictionary objectForKey:a3];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)_setDelay:(double)a3 forApplicationOfKeypath:(id)a4
{
  id v9 = a4;
  int IsZero = BSFloatIsZero();
  delayDictionary = self->_delayDictionary;
  if (IsZero)
  {
    [(NSMutableDictionary *)delayDictionary removeObjectForKey:v9];
  }
  else
  {
    v8 = [NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)delayDictionary setObject:v8 forKey:v9];
  }
}

- (double)delayForApplicationOfKeypath:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_delayDictionary objectForKey:a3];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    objc_msgSend(v7, "bs_CGFloatValue");
    double v9 = v8;
    UIAnimationDragCoefficient();
    double v11 = v9 * v10;
  }
  else
  {
    double v11 = 0.0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayDictionary, 0);
  objc_storeStrong((id *)&self->_behaviorSettingsDictionary, 0);
  objc_storeStrong((id *)&self->_propertyDictionary, 0);
}

@end