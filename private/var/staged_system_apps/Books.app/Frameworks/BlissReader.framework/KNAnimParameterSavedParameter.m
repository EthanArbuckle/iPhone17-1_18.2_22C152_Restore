@interface KNAnimParameterSavedParameter
+ (BOOL)supportsSecureCoding;
- (BOOL)debugOnly;
- (BOOL)hasMaxValue;
- (BOOL)hasMinValue;
- (BOOL)removed;
- (KNAnimParameterSavedParameter)initWithCoder:(id)a3;
- (NSString)name;
- (NSString)parameterDescription;
- (TSDBezierPath)pathValue;
- (double)doubleValue;
- (double)maxValue;
- (double)minValue;
- (id)p_bezierPathFromSavedPathElements:(id)a3;
- (id)p_savedPathFromPath:(id)a3;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setDebugOnly:(BOOL)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasMaxValue:(BOOL)a3;
- (void)setHasMinValue:(BOOL)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setName:(id)a3;
- (void)setParameterDescription:(id)a3;
- (void)setPathValue:(id)a3;
- (void)setRemoved:(BOOL)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation KNAnimParameterSavedParameter

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KNAnimParameterSavedParameter)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)KNAnimParameterSavedParameter;
  v5 = [(KNAnimParameterSavedParameter *)&v21 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nm"];
    v7 = (NSString *)[v6 copy];
    name = v5->_name;
    v5->_name = v7;

    v5->_type = (unint64_t)[v4 decodeIntegerForKey:@"tp"];
    [v4 decodeDoubleForKey:@"dblValue"];
    v5->_doubleValue = v9;
    [v4 decodeDoubleForKey:@"max"];
    v5->_maxValue = v10;
    [v4 decodeDoubleForKey:@"min"];
    v5->_minValue = v11;
    v5->_hasMaxValue = [v4 decodeBoolForKey:@"hmax"];
    v5->_hasMinValue = [v4 decodeBoolForKey:@"hmin"];
    uint64_t v12 = objc_opt_class();
    v13 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, objc_opt_class(), 0);
    v14 = [v4 decodeObjectOfClasses:v13 forKey:@"svdPth"];

    uint64_t v15 = [(KNAnimParameterSavedParameter *)v5 p_bezierPathFromSavedPathElements:v14];
    pathValue = v5->_pathValue;
    v5->_pathValue = (TSDBezierPath *)v15;

    v5->_removed = [v4 decodeBoolForKey:@"removed"];
    v5->_debugOnly = [v4 decodeBoolForKey:@"dbg"];
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"desc"];
    v18 = (NSString *)[v17 copy];
    parameterDescription = v5->_parameterDescription;
    v5->_parameterDescription = v18;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(KNAnimParameterSavedParameter *)self name];
  [v4 encodeObject:v5 forKey:@"nm"];

  [v4 encodeInteger:[self type] forKey:@"tp"];
  [(KNAnimParameterSavedParameter *)self doubleValue];
  [v4 encodeDouble:@"dblValue" forKey:@"dblValue"];
  [(KNAnimParameterSavedParameter *)self maxValue];
  [v4 encodeDouble:@"max" forKey:@"max"];
  [(KNAnimParameterSavedParameter *)self minValue];
  [v4 encodeDouble:@"min" forKey:@"min"];
  [v4 encodeBool:[self hasMaxValue] forKey:@"hmax"];
  [v4 encodeBool:[self hasMinValue] forKey:@"hmin"];
  v6 = [(KNAnimParameterSavedParameter *)self pathValue];
  v7 = [(KNAnimParameterSavedParameter *)self p_savedPathFromPath:v6];
  [v4 encodeObject:v7 forKey:@"svdPth"];

  [v4 encodeBool:[self removed] forKey:@"removed"];
  [v4 encodeBool:[self debugOnly] forKey:@"dbg"];
  id v8 = [(KNAnimParameterSavedParameter *)self parameterDescription];
  [v4 encodeObject:v8 forKey:@"desc"];
}

- (id)p_savedPathFromPath:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = +[NSMutableArray array];
    if ((uint64_t)[v3 elementCount] >= 1)
    {
      uint64_t v5 = 0;
      do
      {
        id v6 = [v3 elementAtIndex:v5 associatedPoints:&v11];
        v7 = objc_alloc_init(KNAnimParameterGroupSavedPathElement);
        id v8 = v7;
        switch((unint64_t)v6)
        {
          case 0uLL:
            uint64_t v9 = 0;
            goto LABEL_7;
          case 1uLL:
            uint64_t v9 = 1;
LABEL_7:
            [(KNAnimParameterGroupSavedPathElement *)v7 setElementType:v9];
            -[KNAnimParameterGroupSavedPathElement setToPoint:](v8, "setToPoint:", v11, v12);
            break;
          case 2uLL:
            [(KNAnimParameterGroupSavedPathElement *)v7 setElementType:2];
            -[KNAnimParameterGroupSavedPathElement setToPoint:](v8, "setToPoint:", v15, v16);
            -[KNAnimParameterGroupSavedPathElement setCp1:](v8, "setCp1:", v11, v12);
            -[KNAnimParameterGroupSavedPathElement setCp2:](v8, "setCp2:", v13, v14);
            break;
          case 3uLL:
            [(KNAnimParameterGroupSavedPathElement *)v7 setElementType:3];
            break;
          default:
            break;
        }
        [v4 addObject:v8];

        ++v5;
      }
      while (v5 < (uint64_t)[v3 elementCount]);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)p_bezierPathFromSavedPathElements:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init((Class)TSDBezierPath);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          switch((unint64_t)objc_msgSend(v10, "elementType", (void)v22))
          {
            case 0uLL:
              [v10 toPoint];
              [v4 moveToPoint:];
              break;
            case 1uLL:
              [v10 toPoint];
              [v4 lineToPoint:];
              break;
            case 2uLL:
              [v10 toPoint];
              double v12 = v11;
              double v14 = v13;
              [v10 cp1];
              double v16 = v15;
              double v18 = v17;
              [v10 cp2];
              [v4 curveToPoint:v12 controlPoint1:v14 controlPoint2:v16];
              break;
            case 3uLL:
              [v4 closePath];
              break;
            default:
              continue;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (TSDBezierPath)pathValue
{
  return self->_pathValue;
}

- (void)setPathValue:(id)a3
{
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setDoubleValue:(double)a3
{
  self->_doubleValue = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (BOOL)hasMaxValue
{
  return self->_hasMaxValue;
}

- (void)setHasMaxValue:(BOOL)a3
{
  self->_hasMaxValue = a3;
}

- (BOOL)hasMinValue
{
  return self->_hasMinValue;
}

- (void)setHasMinValue:(BOOL)a3
{
  self->_hasMinValue = a3;
}

- (BOOL)removed
{
  return self->_removed;
}

- (void)setRemoved:(BOOL)a3
{
  self->_removed = a3;
}

- (BOOL)debugOnly
{
  return self->_debugOnly;
}

- (void)setDebugOnly:(BOOL)a3
{
  self->_debugOnly = a3;
}

- (NSString)parameterDescription
{
  return self->_parameterDescription;
}

- (void)setParameterDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterDescription, 0);
  objc_storeStrong((id *)&self->_pathValue, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end