@interface TPSInclusivityInfo
- (NSArray)excludeValues;
- (NSArray)targetValues;
- (TPSInclusivityInfo)initWithTargetValues:(id)a3 excludeValues:(id)a4;
- (id)debugDescription;
- (void)setExcludeValues:(id)a3;
- (void)setTargetValues:(id)a3;
@end

@implementation TPSInclusivityInfo

- (TPSInclusivityInfo)initWithTargetValues:(id)a3 excludeValues:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TPSInclusivityInfo;
  v9 = [(TPSInclusivityInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_targetValues, a3);
    objc_storeStrong((id *)&v10->_excludeValues, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeValues, 0);

  objc_storeStrong((id *)&self->_targetValues, 0);
}

- (NSArray)targetValues
{
  return self->_targetValues;
}

- (NSArray)excludeValues
{
  return self->_excludeValues;
}

- (id)debugDescription
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  v9.receiver = self;
  v9.super_class = (Class)TPSInclusivityInfo;
  v4 = [(TPSInclusivityInfo *)&v9 debugDescription];
  v5 = (void *)[v3 initWithString:v4];

  v6 = [(TPSInclusivityInfo *)self targetValues];
  [v5 appendFormat:@" %@ = %@", @"include", v6];

  id v7 = [(TPSInclusivityInfo *)self excludeValues];
  [v5 appendFormat:@"; %@ = %@", @"exclude", v7];

  return v5;
}

- (void)setTargetValues:(id)a3
{
}

- (void)setExcludeValues:(id)a3
{
}

@end