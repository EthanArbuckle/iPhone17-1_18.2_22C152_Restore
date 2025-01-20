@interface _UIViewLFLDGeometryChangeRecord
- (NSString)currentLayoutMethodName;
- (NSString)geometricPropertyName;
- (NSValue)geometricPropertyValue;
- (UIView)currentLayoutView;
- (_UIViewLFLDGeometryChangeRecord)initWithGeometricPropertyName:(id)a3 value:(id)a4 currentLayoutView:(id)a5 methodName:(id)a6;
- (id)description;
@end

@implementation _UIViewLFLDGeometryChangeRecord

- (_UIViewLFLDGeometryChangeRecord)initWithGeometricPropertyName:(id)a3 value:(id)a4 currentLayoutView:(id)a5 methodName:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_UIViewLFLDGeometryChangeRecord;
  v15 = [(_UIViewLFLDChangeRecord *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_geometricPropertyName, a3);
    objc_storeStrong((id *)&v16->_geometricPropertyValue, a4);
    objc_storeStrong((id *)&v16->_currentLayoutView, a5);
    objc_storeStrong((id *)&v16->_currentLayoutMethodName, a6);
  }

  return v16;
}

- (id)description
{
  v3 = [(NSValue *)self->_geometricPropertyValue objCType];
  if (!strcmp(v3, "{CGPoint=dd}"))
  {
    [(NSValue *)self->_geometricPropertyValue pointValue];
    [NSString stringWithFormat:@"(%g, %g)", v5, v6, v25, v26];
    v4 = LABEL_8:;
    goto LABEL_9;
  }
  if (!strcmp(v3, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
  {
    [(NSValue *)self->_geometricPropertyValue rectValue];
    [NSString stringWithFormat:@"(%g, %g; %g, %g)", v7, v8, v9, v10];
    goto LABEL_8;
  }
  if (!strcmp(v3, "{UIEdgeInsets=dddd}"))
  {
    [(NSValue *)self->_geometricPropertyValue UIEdgeInsetsValue];
    [NSString stringWithFormat:@"(%g, %g, %g, %g)", v11, v12, v13, v14];
    goto LABEL_8;
  }
  v4 = 0;
LABEL_9:
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"<%@ = %@; ",
                  self->_geometricPropertyName,
                  v4);
  if (self->_currentLayoutView)
  {
    uint64_t v16 = 40;
    BOOL v17 = [(NSString *)self->_currentLayoutMethodName isEqualToString:@"viewWillLayoutSubviews"];
    currentLayoutMethodName = self->_currentLayoutMethodName;
    if (v17
      || (BOOL v19 = [(NSString *)self->_currentLayoutMethodName isEqualToString:@"viewDidLayoutSubviews"], currentLayoutMethodName = self->_currentLayoutMethodName, v19))
    {
      v20 = NSString;
      uint64_t v16 = -[UIView __viewDelegate]((id *)&self->_currentLayoutView->super.super.isa);
      v21 = [v20 stringWithFormat:@"%@ with ", v16];
      int v22 = 1;
    }
    else
    {
      int v22 = 0;
      v21 = &stru_1ED0E84C0;
    }
    v23 = [(UIView *)self->_currentLayoutView _lfld_minimalDescription];
    [v15 appendFormat:@"in -%@ of %@%@; ", currentLayoutMethodName, v21, v23];

    if (v22)
    {
    }
  }
  [v15 appendString:@">"];

  return v15;
}

- (NSString)geometricPropertyName
{
  return self->_geometricPropertyName;
}

- (NSValue)geometricPropertyValue
{
  return self->_geometricPropertyValue;
}

- (UIView)currentLayoutView
{
  return self->_currentLayoutView;
}

- (NSString)currentLayoutMethodName
{
  return self->_currentLayoutMethodName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLayoutMethodName, 0);
  objc_storeStrong((id *)&self->_currentLayoutView, 0);
  objc_storeStrong((id *)&self->_geometricPropertyValue, 0);
  objc_storeStrong((id *)&self->_geometricPropertyName, 0);
}

@end