@interface VIParseResult
- (BOOL)isEqual:(id)a3;
- (VIParseResult)initWithVisualUnderstanding:(id)a3;
- (VIVisualUnderstanding)visualUnderstanding;
- (unint64_t)hash;
@end

@implementation VIParseResult

- (VIParseResult)initWithVisualUnderstanding:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VIParseResult;
  v5 = [(VIParseResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    visualUnderstanding = v5->_visualUnderstanding;
    v5->_visualUnderstanding = (VIVisualUnderstanding *)v6;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v15 = v5;
  uint64_t v16 = v3;
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  visualUnderstanding = self->_visualUnderstanding;
  v13 = objc_msgSend(v11, "visualUnderstanding", v6, v15, v4, v16, v7, v8);
  LOBYTE(visualUnderstanding) = VIObjectIsEqual((unint64_t)visualUnderstanding, (uint64_t)v13);

  return (char)visualUnderstanding;
}

- (unint64_t)hash
{
  return [(VIVisualUnderstanding *)self->_visualUnderstanding hash];
}

- (VIVisualUnderstanding)visualUnderstanding
{
  return self->_visualUnderstanding;
}

- (void).cxx_destruct
{
}

@end