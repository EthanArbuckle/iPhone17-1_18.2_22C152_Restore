@interface CRLConnectionLineAbstractLayoutAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_crlaxVisuallyPointsAtHead;
- (BOOL)_crlaxVisuallyPointsAtTail;
- (BOOL)crlaxIsVisuallyPointingAt:(id)a3;
- (id)crlaxOppositeConnectedLayoutFrom:(id)a3;
@end

@implementation CRLConnectionLineAbstractLayoutAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLConnectionLineAbstractLayout";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (BOOL)crlaxIsVisuallyPointingAt:(id)a3
{
  id v4 = a3;
  if ([(CRLConnectionLineAbstractLayoutAccessibility *)self _crlaxVisuallyPointsAtHead])
  {
    v5 = [(CRLConnectionLineAbstractLayoutAccessibility *)self crlaxTarget];
    id v6 = [v5 connectedTo];
    BOOL v7 = v6 == v4;
  }
  else
  {
    BOOL v7 = 0;
  }
  if ([(CRLConnectionLineAbstractLayoutAccessibility *)self _crlaxVisuallyPointsAtTail])
  {
    v8 = [(CRLConnectionLineAbstractLayoutAccessibility *)self crlaxTarget];
    id v9 = [v8 connectedFrom];
    BOOL v10 = v9 == v4;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v7 || v10;
}

- (id)crlaxOppositeConnectedLayoutFrom:(id)a3
{
  id v4 = a3;
  v5 = [(CRLConnectionLineAbstractLayoutAccessibility *)self crlaxTarget];
  id v6 = [v5 connectedTo];

  BOOL v7 = [(CRLConnectionLineAbstractLayoutAccessibility *)self crlaxTarget];
  v8 = v7;
  if (v6 == v4) {
    [v7 connectedFrom];
  }
  else {
  id v9 = [v7 connectedTo];
  }

  return v9;
}

- (BOOL)_crlaxVisuallyPointsAtHead
{
  id v3 = [(CRLConnectionLineAbstractLayoutAccessibility *)self crlaxTarget];
  id v4 = [v3 strokeHeadLineEnd];

  v5 = [(CRLConnectionLineAbstractLayoutAccessibility *)self crlaxTarget];
  id v6 = [v5 strokeTailLineEnd];

  if (!v4)
  {
    LOBYTE(v7) = 0;
    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    unsigned __int8 v8 = 1;
    goto LABEL_6;
  }
  unsigned int v7 = [v4 isNone] ^ 1;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  unsigned __int8 v8 = [v6 isNone];
LABEL_6:
  char v9 = v7 | v8;

  return v9;
}

- (BOOL)_crlaxVisuallyPointsAtTail
{
  id v3 = [(CRLConnectionLineAbstractLayoutAccessibility *)self crlaxTarget];
  id v4 = [v3 strokeHeadLineEnd];

  v5 = [(CRLConnectionLineAbstractLayoutAccessibility *)self crlaxTarget];
  id v6 = [v5 strokeTailLineEnd];

  if (!v4)
  {
    unsigned int v7 = 1;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unsigned int v7 = [v4 isNone];
  if (v6) {
LABEL_3:
  }
    v7 |= [v6 isNone] ^ 1;
LABEL_4:

  return v7;
}

@end