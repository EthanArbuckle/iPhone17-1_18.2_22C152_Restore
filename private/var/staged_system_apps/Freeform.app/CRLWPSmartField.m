@interface CRLWPSmartField
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)defaultFieldStyleIdentifier;
- (BOOL)allowsEditing;
- (BOOL)allowsPasteAsSmartField;
- (BOOL)canCopy:(_NSRange)a3;
- (BOOL)isEquivalentToObject:(id)a3;
- (CRLWPSmartField)initWithRange:(_NSRange)a3;
- (CRLWPTextSource)parentStorage;
- (NSString)textAttributeUUIDString;
- (_NSRange)range;
- (id)initFromSmartField:(id)a3;
- (id)text;
- (int)styleAttributeArrayKind;
- (unint64_t)attributeArrayKind;
- (unsigned)smartFieldKind;
- (void)resetTextAttributeUUIDString;
- (void)setParentStorage:(id)a3;
- (void)setTextAttributeUUIDString:(id)a3;
@end

@implementation CRLWPSmartField

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    +[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, @"It is illegal to instantiate CRLWPSmartField; it is abstract",
      0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CRLWPSmartField;
  return [super allocWithZone:a3];
}

- (CRLWPSmartField)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)CRLWPSmartField;
  v5 = [(CRLWPSmartField *)&v10 init];
  if (v5)
  {
    id v6 = +[NSUUID UUID];
    uint64_t v7 = [v6 UUIDString];
    textAttributeUUIDString = v5->_textAttributeUUIDString;
    v5->_textAttributeUUIDString = (NSString *)v7;

    v5->_range.NSUInteger location = location;
    v5->_range.NSUInteger length = length;
  }
  return v5;
}

- (id)initFromSmartField:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLWPSmartField;
  v5 = [(CRLWPSmartField *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 textAttributeUUIDString];
    textAttributeUUIDString = v5->_textAttributeUUIDString;
    v5->_textAttributeUUIDString = (NSString *)v6;

    v8 = [v4 parentStorage];
    objc_storeWeak((id *)&v5->_parentStorage, v8);

    v5->_range.NSUInteger location = (NSUInteger)[v4 range];
    v5->_range.NSUInteger length = v9;
  }

  return v5;
}

- (unsigned)smartFieldKind
{
  unsigned int v2 = +[CRLAssertionHandler _atomicIncrementAssertCount];
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D1A68);
  }
  v3 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 67110146;
    unsigned int v17 = v2;
    __int16 v18 = 2082;
    v19 = "-[CRLWPSmartField smartFieldKind]";
    __int16 v20 = 2082;
    v21 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSmartField.mm";
    __int16 v22 = 1024;
    int v23 = 58;
    __int16 v24 = 2114;
    v25 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);
  }
  if (qword_101719A70 != -1) {
    dispatch_once(&qword_101719A70, &stru_1014D1A88);
  }
  uint64_t v6 = off_10166B4A0;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = +[CRLAssertionHandler packedBacktraceString];
    *(_DWORD *)buf = 67109378;
    unsigned int v17 = v2;
    __int16 v18 = 2114;
    v19 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);
  }
  v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSmartField smartFieldKind]");
  NSUInteger v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSmartField.mm"];
  objc_super v10 = (objc_class *)objc_opt_class();
  objc_super v11 = NSStringFromClass(v10);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 58, 0, "Abstract method not overridden by %{public}@", v11);

  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Abstract method not overridden by %@: %s", v13, "-[CRLWPSmartField smartFieldKind]");
  id v15 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v14 userInfo:0];

  objc_exception_throw(v15);
}

- (unint64_t)attributeArrayKind
{
  return 6;
}

- (int)styleAttributeArrayKind
{
  return 6;
}

- (BOOL)allowsEditing
{
  return 0;
}

- (BOOL)allowsPasteAsSmartField
{
  return 1;
}

- (BOOL)canCopy:(_NSRange)a3
{
  return 1;
}

- (id)text
{
  return 0;
}

+ (id)defaultFieldStyleIdentifier
{
  return 0;
}

- (void)resetTextAttributeUUIDString
{
  id v4 = +[NSUUID UUID];
  v3 = [v4 UUIDString];
  [(CRLWPSmartField *)self setTextAttributeUUIDString:v3];
}

- (BOOL)isEquivalentToObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  sub_1002469D0(v5, v4);
  uint64_t v6 = (CRLWPSmartField *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    unsigned __int8 v16 = 1;
  }
  else
  {
    if (v4)
    {
      uint64_t v7 = objc_opt_class();
      v8 = sub_1002469D0(v7, v4);
      NSUInteger v9 = [v8 textAttributeUUIDString];
      if (!self->_textAttributeUUIDString)
      {
        int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D1AA8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_1010718A0();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D1AC8);
        }
        objc_super v11 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
        {
          v12 = +[CRLAssertionHandler packedBacktraceString];
          sub_101069C40(v12, (uint64_t)v24, v10);
        }

        v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSmartField isEquivalentToObject:]");
        v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSmartField.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:111 isFatal:0 description:"Expect to have a UUIDString."];
      }
      if (v9)
      {
        textAttributeUUIDString = self->_textAttributeUUIDString;
        if (textAttributeUUIDString)
        {
          unsigned __int8 v16 = [(NSString *)textAttributeUUIDString isEqualToString:v9];
LABEL_28:

          goto LABEL_29;
        }
      }
      else
      {
        int v17 = +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D1AE8);
        }
        if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
          sub_10107180C();
        }
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014D1B08);
        }
        __int16 v18 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
        {
          v19 = +[CRLAssertionHandler packedBacktraceString];
          sub_101069C40(v19, (uint64_t)&v23, v17);
        }

        __int16 v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPSmartField isEquivalentToObject:]");
        v21 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPSmartField.mm"];
        +[CRLAssertionHandler handleFailureInFunction:v20 file:v21 lineNumber:112 isFatal:0 description:"Expect to have a UUIDString for other object."];
      }
      unsigned __int8 v16 = 0;
      goto LABEL_28;
    }
    unsigned __int8 v16 = 0;
  }
LABEL_29:

  return v16;
}

- (NSString)textAttributeUUIDString
{
  return self->_textAttributeUUIDString;
}

- (void)setTextAttributeUUIDString:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  textAttributeUUIDString = self->_textAttributeUUIDString;
  p_textAttributeUUIDString = &self->_textAttributeUUIDString;
  if (textAttributeUUIDString != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_textAttributeUUIDString, a3);
    uint64_t v5 = v8;
  }
}

- (CRLWPTextSource)parentStorage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentStorage);

  return (CRLWPTextSource *)WeakRetained;
}

- (void)setParentStorage:(id)a3
{
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentStorage);

  objc_storeStrong((id *)&self->_textAttributeUUIDString, 0);
}

@end