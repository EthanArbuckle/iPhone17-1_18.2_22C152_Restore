@interface CRLBasicShapeLibraryShape
+ (id)baseNameForShapeType:(int64_t)a3;
+ (id)p_baseStringForKey:(id)a3;
+ (id)p_nameForShapeType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CRLBasicShapeLibraryShape)initWithShapeType:(int64_t)a3 position:(unint64_t)a4;
- (NSArray)baseKeywords;
- (NSArray)keywords;
- (NSString)accessibilityName;
- (NSString)baseName;
- (NSString)description;
- (NSString)name;
- (id)pathSourceWithSize:(CGSize)a3;
- (int64_t)shapeType;
- (unint64_t)hash;
- (unint64_t)p_position;
- (unint64_t)positionInCategoryWithID:(id)a3;
- (void)setP_position:(unint64_t)a3;
@end

@implementation CRLBasicShapeLibraryShape

- (CRLBasicShapeLibraryShape)initWithShapeType:(int64_t)a3 position:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)CRLBasicShapeLibraryShape;
  v6 = [(CRLBasicShapeLibraryShape *)&v13 init];
  if (v6)
  {
    if (a3 == 21)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA0C8);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010B2E10();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014FA0E8);
      }
      v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v7);
      }
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicShapeLibraryShape initWithShapeType:position:]");
      v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibraryShape.m"];
      +[CRLAssertionHandler handleFailureInFunction:v8 file:v9 lineNumber:32 isFatal:0 description:"Basic shapes do not know about the custom shape type."];
    }
    v6->_shapeType = a3;
    uint64_t v10 = +[CRLBasicShapeLibraryShape p_nameForShapeType:a3];
    name = v6->_name;
    v6->_name = (NSString *)v10;

    v6->_position = a4;
  }
  return v6;
}

+ (id)baseNameForShapeType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x14) {
    CFStringRef v3 = @"Shape";
  }
  else {
    CFStringRef v3 = off_1014FA148[a3];
  }
  v4 = objc_opt_class();

  return [v4 p_baseStringForKey:v3];
}

- (NSString)baseName
{
  CFStringRef v3 = objc_opt_class();
  int64_t v4 = [(CRLBasicShapeLibraryShape *)self shapeType];

  return (NSString *)[v3 baseNameForShapeType:v4];
}

- (NSArray)baseKeywords
{
  CFStringRef v3 = [objc_opt_class() p_baseStringForKey:@"shape"];
  int64_t v4 = &__NSArray0__struct;
  switch([(CRLBasicShapeLibraryShape *)self shapeType])
  {
    case 3:
      v5 = [objc_opt_class() p_baseStringForKey:@"rectangle"];
      v12[0] = v5;
      v12[1] = v3;
      v6 = (void **)v12;
      goto LABEL_7;
    case 4:
      v5 = [objc_opt_class() p_baseStringForKey:@"square"];
      v11 = v5;
      v6 = &v11;
      uint64_t v7 = 1;
      goto LABEL_8;
    case 5:
    case 7:
    case 0xALL:
    case 0xELL:
      v9 = v3;
      int64_t v4 = +[NSArray arrayWithObjects:&v9 count:1];
      break;
    case 6:
      v5 = [objc_opt_class() p_baseStringForKey:@"equilateral triangle"];
      v10[0] = v5;
      v10[1] = v3;
      v6 = (void **)v10;
      goto LABEL_7;
    case 0xDLL:
      v5 = [objc_opt_class() p_baseStringForKey:@"polygon"];
      v13[0] = v5;
      v13[1] = v3;
      v6 = (void **)v13;
LABEL_7:
      uint64_t v7 = 2;
LABEL_8:
      int64_t v4 = +[NSArray arrayWithObjects:v6 count:v7];

      break;
    default:
      break;
  }

  return (NSArray *)v4;
}

- (NSArray)keywords
{
  CFStringRef v3 = +[NSBundle mainBundle];
  int64_t v4 = [v3 localizedStringForKey:@"shape" value:0 table:0];

  int64_t v5 = [(CRLBasicShapeLibraryShape *)self shapeType];
  v6 = &__NSArray0__struct;
  switch(v5)
  {
    case 3:
      uint64_t v7 = +[NSBundle mainBundle];
      v8 = [v7 localizedStringForKey:@"rectangle" value:0 table:0];
      v15[0] = v8;
      v15[1] = v4;
      v9 = (void **)v15;
      goto LABEL_7;
    case 4:
      uint64_t v7 = +[NSBundle mainBundle];
      v8 = [v7 localizedStringForKey:@"square" value:0 table:0];
      v14 = v8;
      v9 = &v14;
      uint64_t v10 = 1;
      goto LABEL_8;
    case 5:
    case 7:
    case 10:
    case 14:
      v12 = v4;
      v6 = +[NSArray arrayWithObjects:&v12 count:1];
      break;
    case 6:
      uint64_t v7 = +[NSBundle mainBundle];
      v8 = [v7 localizedStringForKey:@"equilateral triangle" value:0 table:0];
      v13[0] = v8;
      v13[1] = v4;
      v9 = (void **)v13;
      goto LABEL_7;
    case 13:
      uint64_t v7 = +[NSBundle mainBundle];
      v8 = [v7 localizedStringForKey:@"polygon" value:0 table:0];
      v16[0] = v8;
      v16[1] = v4;
      v9 = (void **)v16;
LABEL_7:
      uint64_t v10 = 2;
LABEL_8:
      v6 = +[NSArray arrayWithObjects:v9 count:v10];

      break;
    default:
      break;
  }

  return (NSArray *)v6;
}

- (id)pathSourceWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int64_t v5 = [(CRLBasicShapeLibraryShape *)self shapeType];

  return +[CRLPathSource pathSourceForShapeType:naturalSize:](CRLPathSource, "pathSourceForShapeType:naturalSize:", v5, width, height);
}

- (unint64_t)positionInCategoryWithID:(id)a3
{
  return [(CRLBasicShapeLibraryShape *)self p_position];
}

- (NSString)accessibilityName
{
  CFStringRef v3 = [(CRLBasicShapeLibraryShape *)self name];
  if ((id)[(CRLBasicShapeLibraryShape *)self shapeType] == (id)9)
  {
    int64_t v4 = +[NSBundle mainBundle];
    int64_t v5 = v4;
    CFStringRef v6 = @"Double arrow";
  }
  else if ((id)[(CRLBasicShapeLibraryShape *)self shapeType] == (id)6)
  {
    int64_t v4 = +[NSBundle mainBundle];
    int64_t v5 = v4;
    CFStringRef v6 = @"Equilateral triangle";
  }
  else
  {
    if ((id)[(CRLBasicShapeLibraryShape *)self shapeType] != (id)7) {
      goto LABEL_8;
    }
    int64_t v4 = +[NSBundle mainBundle];
    int64_t v5 = v4;
    CFStringRef v6 = @"Right triangle";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:0 table:0];

  CFStringRef v3 = (void *)v7;
LABEL_8:

  return (NSString *)v3;
}

+ (id)p_baseStringForKey:(id)a3
{
  id v3 = a3;
  int64_t v4 = +[NSBundle mainBundle];
  int64_t v5 = [v4 localizedStringForKey:v3 value:0 table:0 localization:@"en"];

  CFStringRef v6 = v5;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA108);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010B2EB0();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014FA128);
    }
    uint64_t v7 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v7);
    }
    v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBasicShapeLibraryShape p_baseStringForKey:]");
    v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibraryShape.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 174, 0, "invalid nil value for '%{public}s'", "englishString");

    CFStringRef v6 = v3;
  }
  id v10 = v6;

  return v10;
}

+ (id)p_nameForShapeType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Text";
      break;
    case 1:
    case 20:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Line";
      break;
    case 2:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Connection Line";
      break;
    case 3:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Square";
      break;
    case 4:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Rounded Rectangle";
      break;
    case 5:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Circle";
      break;
    case 6:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Triangle";
      break;
    case 7:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Right Triangle";
      break;
    case 8:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Arrow";
      break;
    case 9:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Double Arrow";
      break;
    case 10:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Diamond";
      break;
    case 11:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Quote Bubble";
      break;
    case 12:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Callout";
      break;
    case 13:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Pentagon";
      break;
    case 14:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Star";
      break;
    case 16:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Line Arrow";
      break;
    default:
      id v3 = +[NSBundle mainBundle];
      int64_t v4 = v3;
      CFStringRef v5 = @"Shape";
      break;
  }
  CFStringRef v6 = [v3 localizedStringForKey:v5 value:0 table:0];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  CFStringRef v6 = sub_1002469D0(v5, v4);

  if (v6)
  {
    id v7 = [(CRLBasicShapeLibraryShape *)self shapeType];
    BOOL v8 = v7 == [v6 shapeType];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  v2 = +[NSNumber numberWithInteger:[(CRLBasicShapeLibraryShape *)self shapeType]];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)description
{
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  uint64_t v5 = [(CRLBasicShapeLibraryShape *)self name];
  CFStringRef v6 = +[NSString stringWithFormat:@"<%@ %p name=%@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)shapeType
{
  return self->_shapeType;
}

- (unint64_t)p_position
{
  return self->_position;
}

- (void)setP_position:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
}

@end