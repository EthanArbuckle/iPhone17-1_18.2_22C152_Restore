@interface NUAssertionInfo
- (BOOL)isClassMethod;
- (BOOL)isFatal;
- (BOOL)isWarning;
- (Class)objectClass;
- (NSString)currentlyExecutingJobName;
- (NSString)fileName;
- (NSString)functionName;
- (NSString)message;
- (SEL)selector;
- (id)description;
- (id)prettyMethodName;
- (unint64_t)lineNumber;
- (void)setCurrentlyExecutingJobName:(id)a3;
- (void)setFileName:(id)a3;
- (void)setFunctionName:(id)a3;
- (void)setIsClassMethod:(BOOL)a3;
- (void)setIsFatal:(BOOL)a3;
- (void)setLineNumber:(unint64_t)a3;
- (void)setMessage:(id)a3;
- (void)setObjectClass:(Class)a3;
- (void)setSelector:(SEL)a3;
@end

@implementation NUAssertionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyExecutingJobName, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_functionName, 0);

  objc_storeStrong((id *)&self->_objectClass, 0);
}

- (void)setIsFatal:(BOOL)a3
{
  self->_isFatal = a3;
}

- (BOOL)isFatal
{
  return self->_isFatal;
}

- (void)setCurrentlyExecutingJobName:(id)a3
{
}

- (NSString)currentlyExecutingJobName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMessage:(id)a3
{
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLineNumber:(unint64_t)a3
{
  self->_lineNumber = a3;
}

- (unint64_t)lineNumber
{
  return self->_lineNumber;
}

- (void)setFileName:(id)a3
{
}

- (NSString)fileName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFunctionName:(id)a3
{
}

- (NSString)functionName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIsClassMethod:(BOOL)a3
{
  self->_isClassMethod = a3;
}

- (BOOL)isClassMethod
{
  return self->_isClassMethod;
}

- (void)setObjectClass:(Class)a3
{
}

- (Class)objectClass
{
  return (Class)objc_getProperty(self, a2, 24, 1);
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (BOOL)isWarning
{
  return ![(NUAssertionInfo *)self isFatal];
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(NUAssertionInfo *)self prettyMethodName];
  v7 = [(NUAssertionInfo *)self message];
  v8 = [(NUAssertionInfo *)self currentlyExecutingJobName];
  v9 = [v3 stringWithFormat:@"<%@: %p> failure in %@: %@ %@", v5, self, v6, v7, v8];

  return v9;
}

- (id)prettyMethodName
{
  v3 = [(NUAssertionInfo *)self functionName];

  if (v3)
  {
    v4 = [(NUAssertionInfo *)self functionName];
  }
  else
  {
    BOOL v5 = [(NUAssertionInfo *)self isClassMethod];
    v6 = NSString;
    v7 = NSStringFromClass([(NUAssertionInfo *)self objectClass]);
    v8 = NSStringFromSelector([(NUAssertionInfo *)self selector]);
    uint64_t v9 = 45;
    if (v5) {
      uint64_t v9 = 43;
    }
    v4 = [v6 stringWithFormat:@"%c[%@ %@]", v9, v7, v8];
  }

  return v4;
}

@end