@interface DynamicTypeWizard
+ (id)_singletonInstance;
+ (id)autoscaledConstraint:(id)a3 constant:(double)a4 withFontProvider:(id)a5;
+ (void)autorefreshLabel:(id)a3 withFontProvider:(id)a4;
+ (void)autoscaleStackView:(id)a3 spacing:(double)a4 withFontProvider:(id)a5;
+ (void)makeObject:(id)a3 performSelector:(SEL)a4 whenSizeCategoryChangesWithOrder:(unint64_t)a5;
+ (void)stopAutoscalingStackView:(id)a3;
+ (void)unregisterObject:(id)a3;
+ (void)updateUnscaledConstantValue:(double)a3 fontProvider:(id)a4 forConstraint:(id)a5;
- (DynamicTypeWizard)init;
- (NSDictionary)objectToSelectorStringMaps;
- (NSMapTable)constraintToValueMap;
- (NSMapTable)labelToFontMap;
- (NSMapTable)stackToValueMap;
- (void)_contentSizeCategoryDidChange;
- (void)setConstraintToValueMap:(id)a3;
- (void)setLabelToFontMap:(id)a3;
- (void)setObjectToSelectorStringMaps:(id)a3;
- (void)setStackToValueMap:(id)a3;
@end

@implementation DynamicTypeWizard

+ (void)autorefreshLabel:(id)a3 withFontProvider:(id)a4
{
  if (a4)
  {
    v6 = (void (*)(id))*((void *)a4 + 2);
    id v7 = a4;
    id v8 = a3;
    v9 = v6(v7);
    [v8 setFont:v9];

    id v12 = [a1 _singletonInstance];
    v10 = [v12 labelToFontMap];
    id v11 = objc_retainBlock(v7);

    [v10 setObject:v11 forKey:v8];
  }
}

+ (id)autoscaledConstraint:(id)a3 constant:(double)a4 withFontProvider:(id)a5
{
  id v8 = a3;
  if (a5)
  {
    id v9 = a5;
    v10 = objc_alloc_init(DynamicTypeValue);
    [(DynamicTypeValue *)v10 setUnscaledValue:a4];
    [(DynamicTypeValue *)v10 setFontProvider:v9];

    sub_100CE0FE4(v8, v10);
    id v11 = [a1 _singletonInstance];
    id v12 = [v11 constraintToValueMap];
    [v12 setObject:v10 forKey:v8];
  }

  return v8;
}

+ (void)updateUnscaledConstantValue:(double)a3 fontProvider:(id)a4 forConstraint:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  id v9 = [a1 _singletonInstance];
  v10 = [v9 constraintToValueMap];
  id v11 = [v10 objectForKey:v8];

  if (v11)
  {
    [v11 setUnscaledValue:a3];
    [v11 setFontProvider:v12];
    sub_100CE0FE4(v8, v11);
  }
}

+ (void)autoscaleStackView:(id)a3 spacing:(double)a4 withFontProvider:(id)a5
{
  if (a5)
  {
    id v8 = a5;
    id v9 = a3;
    id v12 = objc_alloc_init(DynamicTypeValue);
    [(DynamicTypeValue *)v12 setUnscaledValue:a4];
    [(DynamicTypeValue *)v12 setFontProvider:v8];

    [(DynamicTypeValue *)v12 scaledValue];
    UIRoundToViewScale();
    [v9 setSpacing:];
    v10 = [a1 _singletonInstance];
    id v11 = [v10 stackToValueMap];
    [v11 setObject:v12 forKey:v9];
  }
}

+ (void)stopAutoscalingStackView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = [a1 _singletonInstance];
    v5 = [v6 stackToValueMap];
    [v5 removeObjectForKey:v4];
  }
}

+ (void)makeObject:(id)a3 performSelector:(SEL)a4 whenSizeCategoryChangesWithOrder:(unint64_t)a5
{
  id v13 = a3;
  id v8 = [a1 _singletonInstance];
  if (objc_opt_respondsToSelector())
  {
    id v9 = [v8 objectToSelectorStringMaps];
    v10 = +[NSNumber numberWithUnsignedInteger:a5];
    id v11 = [v9 objectForKeyedSubscript:v10];
    id v12 = NSStringFromSelector(a4);
    [v11 setObject:v12 forKey:v13];
  }
}

+ (void)unregisterObject:(id)a3
{
  id v4 = a3;
  v5 = [a1 _singletonInstance];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [&off_1013AE838 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(&off_1013AE838);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        id v11 = [v5 objectToSelectorStringMaps];
        id v12 = [v11 objectForKeyedSubscript:v10];
        [v12 removeObjectForKey:v4];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [&off_1013AE838 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

+ (id)_singletonInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100CE15E4;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_101610F28 != -1) {
    dispatch_once(&qword_101610F28, block);
  }
  v2 = (void *)qword_101610F20;

  return v2;
}

- (DynamicTypeWizard)init
{
  v25.receiver = self;
  v25.super_class = (Class)DynamicTypeWizard;
  v2 = [(DynamicTypeWizard *)&v25 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable weakToStrongObjectsMapTable];
    labelToFontMap = v2->_labelToFontMap;
    v2->_labelToFontMap = (NSMapTable *)v3;

    uint64_t v5 = +[NSMapTable weakToStrongObjectsMapTable];
    constraintToValueMap = v2->_constraintToValueMap;
    v2->_constraintToValueMap = (NSMapTable *)v5;

    uint64_t v7 = +[NSMapTable weakToStrongObjectsMapTable];
    stackToValueMap = v2->_stackToValueMap;
    v2->_stackToValueMap = (NSMapTable *)v7;

    id v9 = objc_alloc_init((Class)NSMutableDictionary);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = [&off_1013AE850 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(&off_1013AE850);
          }
          uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v13);
          long long v15 = +[NSMapTable weakToStrongObjectsMapTable];
          [v9 setObject:v15 forKeyedSubscript:v14];

          long long v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [&off_1013AE850 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
    }
    uint64_t v16 = +[NSDictionary dictionaryWithDictionary:v9];
    objectToSelectorStringMaps = v2->_objectToSelectorStringMaps;
    v2->_objectToSelectorStringMaps = (NSDictionary *)v16;

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v2 selector:"_contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

    v19 = v2;
  }

  return v2;
}

- (void)_contentSizeCategoryDidChange
{
  objectToSelectorStringMaps = self->_objectToSelectorStringMaps;
  id v4 = +[NSNumber numberWithUnsignedInteger:0];
  uint64_t v5 = [(NSDictionary *)objectToSelectorStringMaps objectForKeyedSubscript:v4];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = self->_labelToFontMap;
  id v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v44;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v12 = [(NSMapTable *)self->_labelToFontMap objectForKey:v11];
        long long v13 = (void *)v12;
        if (v12)
        {
          uint64_t v14 = (*(void (**)(uint64_t))(v12 + 16))(v12);
          [v11 setFont:v14];
        }
      }
      id v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v8);
  }

  sub_100CE1B78(v5);
  long long v15 = self->_objectToSelectorStringMaps;
  uint64_t v16 = +[NSNumber numberWithUnsignedInteger:1];
  v17 = [(NSDictionary *)v15 objectForKeyedSubscript:v16];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v18 = self->_constraintToValueMap;
  id v19 = [(NSMapTable *)v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v40;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
        long long v24 = [(NSMapTable *)self->_constraintToValueMap objectForKey:v23];
        sub_100CE0FE4(v23, v24);
      }
      id v20 = [(NSMapTable *)v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v20);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  objc_super v25 = self->_stackToValueMap;
  id v26 = [(NSMapTable *)v25 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v36;
    do
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(void *)v36 != v28) {
          objc_enumerationMutation(v25);
        }
        v30 = *(void **)(*((void *)&v35 + 1) + 8 * (void)k);
        v31 = -[NSMapTable objectForKey:](self->_stackToValueMap, "objectForKey:", v30, (void)v35);
        [v31 scaledValue];
        UIRoundToViewScale();
        [v30 setSpacing:];
      }
      id v27 = [(NSMapTable *)v25 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v27);
  }

  sub_100CE1B78(v17);
  v32 = self->_objectToSelectorStringMaps;
  v33 = +[NSNumber numberWithUnsignedInteger:2];
  v34 = [(NSDictionary *)v32 objectForKeyedSubscript:v33];

  sub_100CE1B78(v34);
}

- (NSMapTable)labelToFontMap
{
  return self->_labelToFontMap;
}

- (void)setLabelToFontMap:(id)a3
{
}

- (NSMapTable)constraintToValueMap
{
  return self->_constraintToValueMap;
}

- (void)setConstraintToValueMap:(id)a3
{
}

- (NSMapTable)stackToValueMap
{
  return self->_stackToValueMap;
}

- (void)setStackToValueMap:(id)a3
{
}

- (NSDictionary)objectToSelectorStringMaps
{
  return self->_objectToSelectorStringMaps;
}

- (void)setObjectToSelectorStringMaps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectToSelectorStringMaps, 0);
  objc_storeStrong((id *)&self->_stackToValueMap, 0);
  objc_storeStrong((id *)&self->_constraintToValueMap, 0);

  objc_storeStrong((id *)&self->_labelToFontMap, 0);
}

@end