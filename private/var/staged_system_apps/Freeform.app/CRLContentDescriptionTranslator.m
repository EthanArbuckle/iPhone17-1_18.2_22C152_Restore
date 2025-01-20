@interface CRLContentDescriptionTranslator
+ (BOOL)hasAnyFreehandDrawingBoardItemsInContentDescription:(id)a3;
+ (BOOL)hasNativeBoardItemsContainingTextInContentDescription:(id)a3;
+ (BOOL)hasNativeBoardItemsInContentDescription:(id)a3;
+ (BOOL)hasNativeTextInContentDescription:(id)a3;
+ (BOOL)hasNativeTypesInContentDescription:(id)a3;
+ (BOOL)hasOnlyFreehandDrawingBoardItemsInContentDescription:(id)a3;
+ (BOOL)hasOnlyNativeTextBoxBoardItemsInContentDescription:(id)a3;
+ (BOOL)hasSingleNativeImageBoardItemInContentDescription:(id)a3;
+ (BOOL)hasSingleNativeMovieBoardItemInContentDescription:(id)a3;
+ (BOOL)hasTextStoragesInContentDescription:(id)a3;
+ (BOOL)p_hasNativeBoardItemsContainingTextInBoardItemDescription:(id)a3;
+ (BOOL)p_hasTextStoragesInBoardItemDescriptions:(id)a3 topLevelBoardItems:(id)a4;
+ (id)descriptionsForBoardItemsInContentDescription:(id)a3;
+ (id)p_boardItemsDescriptionsFromContentDescription:(id)a3;
+ (id)stringToPrefixForStyleCopyingTypeFromDescription:(id)a3;
+ (unint64_t)countOfObjectsInContentDescription:(id)a3;
+ (unint64_t)numberOfBoardItemsInContentDescription:(id)a3;
+ (unint64_t)numberOfTopLevelBoardItemsInContentDescription:(id)a3;
+ (unsigned)elementKindFromBoardItemDescription:(id)a3;
- (CRLContentDescriptionTranslator)init;
- (NSDictionary)appDescriptionData;
- (id)contentDescriptionForBoardItems:(id)a3;
- (id)contentDescriptionForTextStorage:(id)a3 range:(_NSRange)a4 boardItems:(id)a5;
- (id)descriptionForBoardItem:(id)a3;
- (id)descriptionForTextStorage:(id)a3 range:(_NSRange)a4;
- (id)descriptionsForBoardItems:(id)a3;
@end

@implementation CRLContentDescriptionTranslator

- (CRLContentDescriptionTranslator)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLContentDescriptionTranslator;
  v2 = [(CRLContentDescriptionTranslator *)&v5 init];
  appDescriptionData = v2->_appDescriptionData;
  v2->_appDescriptionData = (NSDictionary *)&__NSDictionary0__struct;

  return v2;
}

- (id)descriptionForBoardItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableDictionary dictionaryWithCapacity:3];
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [v5 setObject:v7 forKeyedSubscript:@"class"];

    uint64_t v8 = objc_opt_class();
    v9 = sub_1002469D0(v8, v4);
    unsigned int v10 = [v9 isAutogrowingTextBox];

    if (v10) {
      [v5 setObject:&__kCFBooleanTrue forKeyedSubscript:@"textbox"];
    }
    if (objc_opt_respondsToSelector())
    {
      v11 = [v4 text];
      uint64_t v12 = -[CRLContentDescriptionTranslator descriptionForTextStorage:range:](self, "descriptionForTextStorage:range:", v11, 0, [v11 length]);
      v13 = (void *)v12;
      if (v12)
      {
        uint64_t v17 = v12;
        v14 = +[NSArray arrayWithObjects:&v17 count:1];
        [v5 setObject:v14 forKeyedSubscript:@"text"];
      }
    }
  }
  id v15 = [v5 copy];

  return v15;
}

+ (unint64_t)countOfObjectsInContentDescription:(id)a3
{
  id v3 = a3;
  id v4 = [v3 count];
  objc_super v5 = [v3 objectForKeyedSubscript:@"appData"];

  return (unint64_t)v4 - (v5 != 0);
}

+ (BOOL)hasNativeTypesInContentDescription:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 count];
  objc_super v5 = [v3 objectForKeyedSubscript:@"appData"];

  return v4 > (v5 != 0);
}

- (id)contentDescriptionForBoardItems:(id)a3
{
  unint64_t v4 = [(CRLContentDescriptionTranslator *)self descriptionsForBoardItems:a3];
  if (v4)
  {
    v8[0] = @"appData";
    objc_super v5 = [(CRLContentDescriptionTranslator *)self appDescriptionData];
    v8[1] = @"boardItems";
    v9[0] = v5;
    v9[1] = v4;
    v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  }
  else
  {
    v6 = &__NSDictionary0__struct;
  }

  return v6;
}

- (id)descriptionsForBoardItems:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableArray array];
  if ([v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = -[CRLContentDescriptionTranslator descriptionForBoardItem:](self, "descriptionForBoardItem:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          if (v11) {
            [v5 addObject:v11];
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }

  return v5;
}

+ (id)descriptionsForBoardItemsInContentDescription:(id)a3
{
  return [a3 objectForKeyedSubscript:@"boardItems"];
}

+ (BOOL)hasNativeBoardItemsInContentDescription:(id)a3
{
  id v3 = [a1 p_boardItemsDescriptionsFromContentDescription:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

+ (BOOL)p_hasNativeBoardItemsContainingTextInBoardItemDescription:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10017B918;
  v6[3] = &unk_1014DC058;
  v6[4] = &v7;
  [v3 enumerateObjectsUsingBlock:v6];
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (BOOL)hasNativeBoardItemsContainingTextInContentDescription:(id)a3
{
  char v4 = [a3 objectForKeyedSubscript:@"boardItems"];
  LOBYTE(a1) = [a1 p_hasNativeBoardItemsContainingTextInBoardItemDescription:v4];

  return (char)a1;
}

+ (BOOL)hasSingleNativeImageBoardItemInContentDescription:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"boardItems"];
  if ([v3 count] == (id)1)
  {
    char v4 = [v3 firstObject];
    objc_super v5 = (objc_class *)objc_opt_class();
    id v6 = [v4 objectForKeyedSubscript:@"class"];
    sub_10024715C(v5, v6);
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      Class v8 = NSClassFromString(v7);
      if (v8) {
        LOBYTE(v8) = [(objc_class *)v8 isSubclassOfClass:objc_opt_class()];
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

+ (BOOL)hasSingleNativeMovieBoardItemInContentDescription:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"boardItems"];
  if ([v3 count] == (id)1)
  {
    char v4 = [v3 firstObject];
    objc_super v5 = (objc_class *)objc_opt_class();
    id v6 = [v4 objectForKeyedSubscript:@"class"];
    sub_10024715C(v5, v6);
    uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      Class v8 = NSClassFromString(v7);
      if (v8) {
        LOBYTE(v8) = [(objc_class *)v8 isSubclassOfClass:objc_opt_class()];
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

+ (BOOL)hasOnlyNativeTextBoxBoardItemsInContentDescription:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"boardItems"];
  if ([v3 count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = v3;
    id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          char v10 = (objc_class *)objc_opt_class();
          v11 = [v9 objectForKeyedSubscript:@"textbox"];
          uint64_t v12 = sub_10024715C(v10, v11);
          unsigned int v13 = [v12 BOOLValue];

          if (!v13)
          {
            BOOL v14 = 0;
            goto LABEL_12;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v14 = 1;
LABEL_12:
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

+ (BOOL)hasOnlyFreehandDrawingBoardItemsInContentDescription:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"boardItems"];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  BOOL v11 = 0;
  BOOL v11 = [v4 count] != 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017BF50;
  v7[3] = &unk_1014DC058;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (BOOL)hasAnyFreehandDrawingBoardItemsInContentDescription:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"boardItems"];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10017C124;
  v7[3] = &unk_1014DC058;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (unint64_t)numberOfBoardItemsInContentDescription:(id)a3
{
  id v3 = [a1 p_boardItemsDescriptionsFromContentDescription:a3];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

+ (unint64_t)numberOfTopLevelBoardItemsInContentDescription:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"boardItems"];
  id v4 = [v3 count];

  return (unint64_t)v4;
}

- (id)descriptionForTextStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  id v5 = a3;
  id v6 = v5;
  if (!v5) {
    goto LABEL_14;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (length)
  {
    uint64_t v7 = 1;
    if (![v5 hasVisibleContent:@"hasText" *((void *)&v17 + 1) v18 *((void *)&v19 + 1) v20])goto LABEL_8; {
  }
    }
  else
  {
    if ((objc_msgSend(v5, "hasVisibleContent", v17, v18, v19, v20) & 1) == 0)
    {
      unsigned int v13 = 0;
      goto LABEL_9;
    }
    LODWORD(v7) = 0;
  }
  char v8 = v7;
  uint64_t v9 = (void **)((unint64_t)&v19 | (8 * v7));
  uint64_t v10 = *v9;
  uint64_t *v9 = &__kCFBooleanTrue;

  uint64_t v7 = (v7 + 1);
  char v11 = (void **)((unint64_t)&v17 & 0xFFFFFFFFFFFFFFF7 | (8 * (v8 & 1)));
  uint64_t v12 = *v11;
  void *v11 = @"hasVisibleText";

LABEL_8:
  unsigned int v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v17 count:v7];
LABEL_9:
  for (uint64_t i = 24; i != -8; i -= 8)

  for (uint64_t j = 24; j != -8; j -= 8)
  if (!v13)
  {
LABEL_14:
    unsigned int v13 = +[NSDictionary dictionary];
  }

  return v13;
}

- (id)contentDescriptionForTextStorage:(id)a3 range:(_NSRange)a4 boardItems:(id)a5
{
  id v6 = -[CRLContentDescriptionTranslator descriptionForTextStorage:range:](self, "descriptionForTextStorage:range:", a3, a4.location, a4.length, a5);
  if ([v6 count])
  {
    v10[0] = @"appData";
    uint64_t v7 = [(CRLContentDescriptionTranslator *)self appDescriptionData];
    v10[1] = @"text";
    v11[0] = v7;
    v11[1] = v6;
    char v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  }
  else
  {
    char v8 = &__NSDictionary0__struct;
  }

  return v8;
}

+ (unsigned)elementKindFromBoardItemDescription:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = [v3 objectForKeyedSubscript:@"elementKind"];

  id v6 = sub_10024715C(v4, v5);

  LODWORD(v3) = [v6 unsignedIntegerValue];
  return v3;
}

+ (BOOL)hasNativeTextInContentDescription:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"text"];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = [v3 objectForKeyedSubscript:@"hasText"];
  id v6 = sub_10024715C(v4, v5);
  unsigned __int8 v7 = [v6 BOOLValue];

  return v7;
}

+ (BOOL)hasTextStoragesInContentDescription:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"text"];
  if (!v5) {
    goto LABEL_4;
  }
  id v6 = (objc_class *)objc_opt_class();
  unsigned __int8 v7 = [v5 objectForKeyedSubscript:@"hasText"];
  char v8 = sub_10024715C(v6, v7);
  unsigned __int8 v9 = [v8 BOOLValue];

  if (v9)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
LABEL_4:
    char v11 = [v4 objectForKeyedSubscript:@"boardItems"];
    unsigned __int8 v10 = [a1 p_hasTextStoragesInBoardItemDescriptions:v11 topLevelBoardItems:v11];
  }
  return v10;
}

+ (id)p_boardItemsDescriptionsFromContentDescription:(id)a3
{
  return [a3 objectForKeyedSubscript:@"boardItems"];
}

+ (BOOL)p_hasTextStoragesInBoardItemDescriptions:(id)a3 topLevelBoardItems:(id)a4
{
  return [a3 crl_enumerateAllBoardItemsNestedRecursivelyUsingBlock:&stru_1014DC098, a4];
}

- (NSDictionary)appDescriptionData
{
  return self->_appDescriptionData;
}

- (void).cxx_destruct
{
}

+ (id)stringToPrefixForStyleCopyingTypeFromDescription:(id)a3
{
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1009DBAEC(v3);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  if (v5)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }

  return v6;
}

@end