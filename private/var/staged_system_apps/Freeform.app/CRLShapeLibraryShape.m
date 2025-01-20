@interface CRLShapeLibraryShape
+ (id)baseKeywordsForShapeFromDictionary:(id)a3 keywordDelimiter:(id)a4;
+ (id)baseNameForShapeFromDictionary:(id)a3;
+ (id)localizedKeywordsForShapeFromDictionary:(id)a3 keywordDelimiter:(id)a4;
+ (id)localizedNameForShapeFromDictionary:(id)a3;
+ (id)p_localizationKeyForShapeFromDictionary:(id)a3;
+ (id)p_stringForKey:(id)a3 inBaseStringsTableWithName:(id)a4;
+ (id)shapeIDForShapeFromDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)rendersSlowly;
- (CRLBezierPath)p_bezierPath;
- (CRLShapeLibraryShape)initWithDictionary:(id)a3 keywordDelimiter:(id)a4;
- (NSArray)categoryIDs;
- (NSArray)keywords;
- (NSNumber)shapeID;
- (NSString)bezierPathString;
- (NSString)description;
- (NSString)localizationKey;
- (NSString)name;
- (NSString)p_keywordDelimiter;
- (id)p_categoryMetadata;
- (id)pathSourceWithSize:(CGSize)a3;
- (int64_t)shapeType;
- (unint64_t)hash;
- (unint64_t)positionInCategoryWithID:(id)a3;
- (void)setP_bezierPath:(id)a3;
- (void)setP_keywordDelimiter:(id)a3;
@end

@implementation CRLShapeLibraryShape

+ (id)baseKeywordsForShapeFromDictionary:(id)a3 keywordDelimiter:(id)a4
{
  id v6 = a4;
  v7 = [a1 p_localizationKeyForShapeFromDictionary:a3];
  v8 = [a1 p_stringForKey:v7 inBaseStringsTableWithName:@"CRLShapeLibrarianKeywords"];
  v9 = [v8 componentsSeparatedByString:v6];

  return v9;
}

+ (id)baseNameForShapeFromDictionary:(id)a3
{
  v4 = [a1 p_localizationKeyForShapeFromDictionary:a3];
  v5 = [a1 p_stringForKey:v4 inBaseStringsTableWithName:@"CRLShapeLibrarianShapeNames"];

  return v5;
}

+ (id)localizedKeywordsForShapeFromDictionary:(id)a3 keywordDelimiter:(id)a4
{
  id v6 = a4;
  v7 = [a1 p_localizationKeyForShapeFromDictionary:a3];
  v8 = +[NSBundle mainBundle];
  v9 = [v8 localizedStringForKey:v7 value:0 table:@"CRLShapeLibrarianKeywords"];

  v10 = [v9 componentsSeparatedByString:v6];

  return v10;
}

+ (id)localizedNameForShapeFromDictionary:(id)a3
{
  v3 = [a1 p_localizationKeyForShapeFromDictionary:a3];
  v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:v3 value:0 table:@"CRLShapeLibrarianShapeNames"];

  return v5;
}

+ (id)shapeIDForShapeFromDictionary:(id)a3
{
  return [a3 objectForKey:@"id"];
}

+ (id)p_localizationKeyForShapeFromDictionary:(id)a3
{
  return [a3 objectForKey:@"localizationKey"];
}

+ (id)p_stringForKey:(id)a3 inBaseStringsTableWithName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:v5 value:0 table:v6 localization:@"en"];

  v9 = v8;
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFC80);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E148();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFCA0);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v10);
    }
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLShapeLibraryShape p_stringForKey:inBaseStringsTableWithName:]");
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryShape.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 93, 0, "invalid nil value for '%{public}s'", "englishString");

    v9 = v5;
  }
  id v13 = v9;

  return v13;
}

- (CRLShapeLibraryShape)initWithDictionary:(id)a3 keywordDelimiter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CRLShapeLibraryShape;
  v8 = [(CRLShapeLibraryObject *)&v16 initWithDictionary:v6];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_keywordDelimiter, a4);
    v10 = [v6 objectForKey:@"shapePath"];
    v11 = (NSString *)[v10 copy];
    bezierPathString = v9->_bezierPathString;
    v9->_bezierPathString = v11;

    id v13 = [[CRLBezierPath alloc] initWithCString:[(NSString *)v9->_bezierPathString UTF8String]];
    bezierPath = v9->_bezierPath;
    v9->_bezierPath = v13;

    v9->_rendersSlowly = [(CRLBezierPath *)v9->_bezierPath elementCount] > 1000;
    [(CRLShapeLibraryObject *)v9 i_removeObjectForKey:@"shapePath"];
  }

  return v9;
}

- (NSArray)categoryIDs
{
  id v3 = objc_alloc_init((Class)NSNumberFormatter);
  v4 = [(CRLShapeLibraryShape *)self p_categoryMetadata];
  id v5 = [v4 allKeys];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100075F78;
  v10[3] = &unk_1014CFCC8;
  id v11 = v3;
  id v6 = v3;
  id v7 = [v5 crl_arrayByMappingObjectsUsingBlock:v10];
  v8 = [v7 sortedArrayUsingSelector:"compare:"];

  return (NSArray *)v8;
}

- (NSString)localizationKey
{
  id v3 = objc_opt_class();
  v4 = [(CRLShapeLibraryObject *)self i_dictionary];
  id v5 = [v3 p_localizationKeyForShapeFromDictionary:v4];

  return (NSString *)v5;
}

- (NSString)name
{
  id v3 = objc_opt_class();
  v4 = [(CRLShapeLibraryObject *)self i_dictionary];
  id v5 = [v3 localizedNameForShapeFromDictionary:v4];

  return (NSString *)v5;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(CRLShapeLibraryShape *)self name];
  id v6 = +[NSString stringWithFormat:@"<%@ %p name=%@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSNumber)shapeID
{
  id v3 = objc_opt_class();
  v4 = [(CRLShapeLibraryObject *)self i_dictionary];
  id v5 = [v3 shapeIDForShapeFromDictionary:v4];

  return (NSNumber *)v5;
}

- (int64_t)shapeType
{
  return 21;
}

- (NSArray)keywords
{
  id v3 = objc_opt_class();
  v4 = [(CRLShapeLibraryObject *)self i_dictionary];
  id v5 = [(CRLShapeLibraryShape *)self p_keywordDelimiter];
  id v6 = [v3 localizedKeywordsForShapeFromDictionary:v4 keywordDelimiter:v5];

  return (NSArray *)v6;
}

- (id)pathSourceWithSize:(CGSize)a3
{
  v4 = [(CRLShapeLibraryShape *)self p_bezierPath];
  id v5 = +[CRLBezierPathSource pathSourceWithBezierPath:v4];

  id v6 = [(CRLShapeLibraryShape *)self localizationKey];
  [v5 setLocalizationKey:v6];

  return v5;
}

- (unint64_t)positionInCategoryWithID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFCE8);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106E1F8();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014CFD08);
    }
    id v5 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v5);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLibraryShape positionInCategoryWithID:]");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLibraryShape.m"];
    +[CRLAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:150 isFatal:0 description:"Must pass a categoryID when fetching a shape library shape's position."];
  }
  v8 = [(CRLShapeLibraryShape *)self p_categoryMetadata];
  v9 = [v4 stringValue];
  v10 = [v8 objectForKeyedSubscript:v9];
  id v11 = [v10 objectForKeyedSubscript:@"position"];

  if (v11) {
    unint64_t v12 = (unint64_t)[v11 unsignedIntegerValue];
  }
  else {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = sub_1002469D0(v5, v4);

  uint64_t v7 = [(CRLShapeLibraryShape *)self shapeID];
  uint64_t v8 = [v6 shapeID];
  if (v7 | v8) {
    unsigned __int8 v9 = [(id)v7 isEqual:v8];
  }
  else {
    unsigned __int8 v9 = 1;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(CRLShapeLibraryShape *)self shapeID];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)p_categoryMetadata
{
  v2 = [(CRLShapeLibraryObject *)self i_dictionary];
  id v3 = [v2 objectForKeyedSubscript:@"categories"];

  return v3;
}

- (NSString)bezierPathString
{
  return self->_bezierPathString;
}

- (BOOL)rendersSlowly
{
  return self->_rendersSlowly;
}

- (CRLBezierPath)p_bezierPath
{
  return self->_bezierPath;
}

- (void)setP_bezierPath:(id)a3
{
}

- (NSString)p_keywordDelimiter
{
  return self->_keywordDelimiter;
}

- (void)setP_keywordDelimiter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordDelimiter, 0);
  objc_storeStrong((id *)&self->_bezierPath, 0);

  objc_storeStrong((id *)&self->_bezierPathString, 0);
}

@end