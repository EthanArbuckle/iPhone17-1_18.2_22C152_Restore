@interface URMTLStructMemberInternal
- (BOOL)supportsSecureCoding;
- (NSString)name;
- (URMTLStructMemberInternal)init;
- (URMTLStructMemberInternal)initWithCoder:(id)a3;
- (unint64_t)aluType;
- (unint64_t)argumentIndex;
- (unint64_t)dataType;
- (unint64_t)offset;
- (unint64_t)pixelFormat;
- (unint64_t)raster_order_group;
- (unint64_t)render_target;
- (void)encodeWithCoder:(id)a3;
- (void)setAluType:(unint64_t)a3;
- (void)setArgumentIndex:(unint64_t)a3;
- (void)setDataType:(unint64_t)a3;
- (void)setName:(id)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setPixelFormat:(unint64_t)a3;
- (void)setRaster_order_group:(unint64_t)a3;
- (void)setRender_target:(unint64_t)a3;
@end

@implementation URMTLStructMemberInternal

- (URMTLStructMemberInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)URMTLStructMemberInternal;
  return [(URMTLStructMemberInternal *)&v3 init];
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unint64_t)a3
{
  self->_dataType = a3;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (void)setPixelFormat:(unint64_t)a3
{
  self->_pixelFormat = a3;
}

- (unint64_t)aluType
{
  return self->_aluType;
}

- (void)setAluType:(unint64_t)a3
{
  self->_aluType = a3;
}

- (unint64_t)render_target
{
  return self->_render_target;
}

- (void)setRender_target:(unint64_t)a3
{
  self->_render_target = a3;
}

- (unint64_t)raster_order_group
{
  return self->_raster_order_group;
}

- (void)setRaster_order_group:(unint64_t)a3
{
  self->_raster_order_group = a3;
}

- (unint64_t)argumentIndex
{
  return self->_argumentIndex;
}

- (void)setArgumentIndex:(unint64_t)a3
{
  self->_argumentIndex = a3;
}

- (void).cxx_destruct
{
}

- (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7 = objc_msgSend_name(self, v5, v6);
  objc_msgSend_encodeObject_forKey_(v4, v8, (uint64_t)v7, @"name");

  v9 = NSNumber;
  uint64_t v12 = objc_msgSend_offset(self, v10, v11);
  v14 = objc_msgSend_numberWithUnsignedInteger_(v9, v13, v12);
  objc_msgSend_encodeObject_forKey_(v4, v15, (uint64_t)v14, @"offset");

  v16 = NSNumber;
  uint64_t v19 = objc_msgSend_dataType(self, v17, v18);
  v21 = objc_msgSend_numberWithUnsignedInteger_(v16, v20, v19);
  objc_msgSend_encodeObject_forKey_(v4, v22, (uint64_t)v21, @"dataType");

  v23 = NSNumber;
  uint64_t v26 = objc_msgSend_argumentIndex(self, v24, v25);
  objc_msgSend_numberWithUnsignedInteger_(v23, v27, v26);
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v28, (uint64_t)v29, @"argumentIndex");
}

- (URMTLStructMemberInternal)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(URMTLStructMemberInternal);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v9 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, @"name");
  objc_msgSend_setName_(v5, v10, (uint64_t)v9);

  uint64_t v12 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v11, v6, @"offset");
  uint64_t v15 = objc_msgSend_unsignedIntegerValue(v12, v13, v14);
  objc_msgSend_setOffset_(v5, v16, v15);

  uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v17, v6, @"dataType");
  uint64_t v21 = objc_msgSend_unsignedIntegerValue(v18, v19, v20);
  objc_msgSend_setDataType_(v5, v22, v21);

  v24 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v23, v6, @"argumentIndex");

  uint64_t v27 = objc_msgSend_unsignedIntegerValue(v24, v25, v26);
  objc_msgSend_setArgumentIndex_(v5, v28, v27);

  return v5;
}

@end