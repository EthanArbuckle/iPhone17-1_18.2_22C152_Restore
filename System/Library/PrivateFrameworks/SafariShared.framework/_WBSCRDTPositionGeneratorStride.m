@interface _WBSCRDTPositionGeneratorStride
- (NSArray)recordNames;
- (WBSCRDTPosition)afterPosition;
- (WBSCRDTPosition)beforePosition;
- (_WBSCRDTPositionGeneratorStride)initWithRecordNames:(id)a3 beforePosition:(id)a4 afterPosition:(id)a5;
- (id)description;
@end

@implementation _WBSCRDTPositionGeneratorStride

- (_WBSCRDTPositionGeneratorStride)initWithRecordNames:(id)a3 beforePosition:(id)a4 afterPosition:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_WBSCRDTPositionGeneratorStride;
  v11 = [(_WBSCRDTPositionGeneratorStride *)&v16 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    recordNames = v11->_recordNames;
    v11->_recordNames = (NSArray *)v12;

    objc_storeStrong((id *)&v11->_beforePosition, a4);
    objc_storeStrong((id *)&v11->_afterPosition, a5);
    v14 = v11;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(NSArray *)self->_recordNames componentsJoinedByString:@", "];
  v6 = [v3 stringWithFormat:@"<%@: %p, record names: [ %@ ], before position: %@, after position: %@>", v4, self, v5, self->_beforePosition, self->_afterPosition];

  return v6;
}

- (NSArray)recordNames
{
  return self->_recordNames;
}

- (WBSCRDTPosition)beforePosition
{
  return self->_beforePosition;
}

- (WBSCRDTPosition)afterPosition
{
  return self->_afterPosition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_afterPosition, 0);
  objc_storeStrong((id *)&self->_beforePosition, 0);
  objc_storeStrong((id *)&self->_recordNames, 0);
}

@end