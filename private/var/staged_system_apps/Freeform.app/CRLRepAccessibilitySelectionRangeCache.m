@interface CRLRepAccessibilitySelectionRangeCache
- (BOOL)isSafeToRestoreSelectionInRep:(id)a3;
- (CRLRepAccessibilitySelectionRangeCache)init;
- (CRLRepAccessibilitySelectionRangeCache)initWithRep:(id)a3 selectedRangeInStorage:(_NSRange)a4;
- (_NSRange)rangeInStorage;
- (id)description;
- (unint64_t)versionNumber;
- (void)setRangeInStorage:(_NSRange)a3;
- (void)setVersionNumber:(unint64_t)a3;
@end

@implementation CRLRepAccessibilitySelectionRangeCache

- (CRLRepAccessibilitySelectionRangeCache)init
{
  return -[CRLRepAccessibilitySelectionRangeCache initWithRep:selectedRangeInStorage:](self, "initWithRep:selectedRangeInStorage:", 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (CRLRepAccessibilitySelectionRangeCache)initWithRep:(id)a3 selectedRangeInStorage:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v7.receiver = self;
  v7.super_class = (Class)CRLRepAccessibilitySelectionRangeCache;
  result = [(CRLRepAccessibilitySelectionRangeCache *)&v7 init];
  if (result)
  {
    result->_rangeInStorage.NSUInteger location = location;
    result->_rangeInStorage.NSUInteger length = length;
  }
  return result;
}

- (BOOL)isSafeToRestoreSelectionInRep:(id)a3
{
  id v4 = a3;
  v5 = [v4 crlaxStorage];
  v6 = (char *)[v5 crlaxRange];
  uint64_t v8 = v7;
  v9 = (char *)[(CRLRepAccessibilitySelectionRangeCache *)self rangeInStorage];
  if (v6 > v9)
  {
    BOOL v11 = 0;
LABEL_6:

    goto LABEL_7;
  }
  v12 = &v6[v8];
  v13 = &v9[v10];

  if (v12 >= v13)
  {
    id v14 = [(CRLRepAccessibilitySelectionRangeCache *)self versionNumber];
    v5 = [v4 crlaxStorage];
    BOOL v11 = v14 == [v5 crlaxChangeCount];
    goto LABEL_6;
  }
  BOOL v11 = 0;
LABEL_7:

  return v11;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  v9.NSUInteger location = (NSUInteger)[(CRLRepAccessibilitySelectionRangeCache *)self rangeInStorage];
  v5 = NSStringFromRange(v9);
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@: %p; Range: %@; Version: %lu>",
    v4,
    self,
    v5,
  v6 = [(CRLRepAccessibilitySelectionRangeCache *)self versionNumber]);

  return v6;
}

- (_NSRange)rangeInStorage
{
  NSUInteger length = self->_rangeInStorage.length;
  NSUInteger location = self->_rangeInStorage.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setRangeInStorage:(_NSRange)a3
{
  self->_rangeInStorage = a3;
}

- (unint64_t)versionNumber
{
  return self->_versionNumber;
}

- (void)setVersionNumber:(unint64_t)a3
{
  self->_versionNumber = a3;
}

@end