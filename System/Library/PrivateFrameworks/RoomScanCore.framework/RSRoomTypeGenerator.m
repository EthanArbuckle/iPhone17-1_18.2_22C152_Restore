@interface RSRoomTypeGenerator
- (RSRoomTypeGenerator)init;
- (id).cxx_construct;
@end

@implementation RSRoomTypeGenerator

- (id).cxx_construct
{
  self->_detector.model_._output_tensor.__tree_.__pair1_.__value_.__left_ = 0;
  self->_obb_detector._prev_main_vec.var0.__null_state_ = 0;
  self->_anon_a[6] = 0;
  self->_detector.model_._vptr$IEspresso_Interface_v1 = (void **)&unk_2708F17E0;
  self->_detector.model_._output_tensor.__tree_.__begin_node_ = &self->_detector.model_._output_tensor.__tree_.__pair1_;
  *(_OWORD *)&self->_detector.model_._previous_mode.__r_.__value_.var0.__l.__size_ = 0uLL;
  self->_detector.model_._ctx = 0;
  self->_detector.model_._plan = 0;
  self->_detector.model_._output_tensor.__tree_.__pair3_.__value_ = 0;
  *((unsigned char *)&self->_detector.model_._previous_mode.__r_.__value_.var0.__l + 23) = 8;
  self->_detector.model_._previous_mode.__r_.__value_.var0.__l.__data_ = (char *)0x6E776F6E6B5F6E75;
  LOBYTE(self->_detector.model_._previous_mode.__r_.var0) = 1;
  sub_25B54A1F0(&self->_detector.model_._previous_mode.var0);
  sub_25B54A1F0((uint64_t *)&self->_cfg);
  return self;
}

- (void).cxx_destruct
{
  sub_25B54BBDC((uint64_t)&self->_cfg);
  objc_storeStrong((id *)&self->_geoEstimator, 0);
  sub_25B54BBDC((uint64_t)&self->_detector.model_._previous_mode.var0);
  sub_25B520404((uint64_t)&self->_detector);

  objc_storeStrong((id *)&self->_inputImage, 0);
}

- (RSRoomTypeGenerator)init
{
  v23.receiver = self;
  v23.super_class = (Class)RSRoomTypeGenerator;
  v2 = [(RSRoomTypeGenerator *)&v23 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263F086E0];
    uint64_t v4 = objc_opt_class();
    v7 = objc_msgSend_bundleForClass_(v3, v5, v4);
    v8 = v2 + 552;
    if (v2[575] < 0) {
      v8 = (void *)*v8;
    }
    v9 = objc_msgSend_stringWithUTF8String_(NSString, v6, (uint64_t)v8);
    objc_msgSend_pathForResource_ofType_(v7, v10, (uint64_t)v9, 0);
    id v11 = objc_claimAutoreleasedReturnValue();
    v14 = (char *)objc_msgSend_UTF8String(v11, v12, v13);
    sub_25B403500(&v21, v14);

    v2[120] = 1;
    *((void *)v2 + 8) = espresso_create_context();
    *((void *)v2 + 9) = espresso_create_plan();
    if (espresso_plan_add_network()) {
      goto LABEL_14;
    }
    if (*((void *)v2 + 28) != *((void *)v2 + 27))
    {
      espresso_network_declare_output();
      operator new();
    }
    if (v2[119] < 0)
    {
      *((void *)v2 + 13) = 8;
      v15 = (char *)*((void *)v2 + 12);
    }
    else
    {
      v15 = v2 + 96;
      v2[119] = 8;
    }
    strcpy(v15, "un_known");
    if (espresso_plan_build() || (sub_25B5204FC((uint64_t)(v2 + 32)) & 1) == 0)
    {
LABEL_14:
      if (qword_26A5020B0 != -1) {
        dispatch_once(&qword_26A5020B0, &unk_2708F1218);
      }
      v19 = (id)qword_26A5020A8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LOWORD(__p[0]) = 0;
        _os_log_error_impl(&dword_25B3F3000, v19, OS_LOG_TYPE_ERROR, "Load room type v4 model failed", (uint8_t *)__p, 2u);
      }

      v16 = 0;
    }
    else
    {
      v17 = sub_25B400488([RSOfflineGeometryCalculation alloc], *((_DWORD *)v2 + 110), v2[472], *((_DWORD *)v2 + 116), *((float *)v2 + 112));
      v18 = (void *)*((void *)v2 + 54);
      *((void *)v2 + 54) = v17;

      v16 = v2;
    }
    if (v22 < 0) {
      operator delete(v21);
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end