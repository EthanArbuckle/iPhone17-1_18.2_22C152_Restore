@interface UIShapeResolutionContext
- (UIResolvedShape)contentShape;
- (UIShapeResolutionContext)init;
- (UIShapeResolutionContext)initWithView:(id)a3;
@end

@implementation UIShapeResolutionContext

- (UIShapeResolutionContext)initWithView:(id)a3
{
  id v28 = a3;
  v29 = [(UIShapeResolutionContext *)self init];
  id v4 = objc_msgSend(v28, sel_layer);
  sub_1858FF8F4((uint64_t)v30);
  v5 = (void *)v30[0];
  uint64_t v6 = v30[1];
  uint64_t v7 = v30[2];
  uint64_t v8 = v30[3];
  uint64_t v9 = v30[4];
  uint64_t v10 = v30[5];
  uint64_t v11 = v30[6];
  char v27 = v31;
  objc_msgSend(v4, sel_bounds);
  char v32 = 0;
  *(void *)v35 = 1;
  memset(&v35[8], 0, 48);
  v35[56] = 6;
  *(void *)&long long v36 = v12;
  *((void *)&v36 + 1) = v13;
  *(void *)&long long v37 = v14;
  *((void *)&v37 + 1) = v15;
  *(void *)v38 = 0;
  *(void *)&v38[8] = 0;
  *(void *)&v38[16] = -1;
  v38[24] = 0;
  UIShape.resolve(in:)((uint64_t)v35, (uint64_t)v33);
  sub_185636BB4(v5, v6, v7, v8, v9, v10, v11, v27);

  v16 = (_OWORD *)((char *)v29 + OBJC_IVAR___UIShapeResolutionContext_value);
  long long v17 = *(_OWORD *)&v29->value[OBJC_IVAR___UIShapeResolutionContext_value + 40];
  long long v19 = *(_OWORD *)((char *)&v29->super.isa + OBJC_IVAR___UIShapeResolutionContext_value);
  long long v18 = *(_OWORD *)&v29->value[OBJC_IVAR___UIShapeResolutionContext_value + 8];
  *(_OWORD *)&v35[32] = *(_OWORD *)&v29->value[OBJC_IVAR___UIShapeResolutionContext_value + 24];
  *(_OWORD *)&v35[48] = v17;
  *(_OWORD *)v35 = v19;
  *(_OWORD *)&v35[16] = v18;
  long long v21 = *(_OWORD *)&v29->value[OBJC_IVAR___UIShapeResolutionContext_value + 72];
  long long v20 = *(_OWORD *)&v29->value[OBJC_IVAR___UIShapeResolutionContext_value + 88];
  long long v22 = *(_OWORD *)&v29->value[OBJC_IVAR___UIShapeResolutionContext_value + 56];
  *(_OWORD *)&v38[9] = *(_OWORD *)&v29->value[OBJC_IVAR___UIShapeResolutionContext_value + 97];
  long long v37 = v21;
  *(_OWORD *)v38 = v20;
  long long v36 = v22;
  long long v23 = v33[5];
  v16[4] = v33[4];
  v16[5] = v23;
  v16[6] = v34[0];
  *(_OWORD *)((char *)v16 + 105) = *(_OWORD *)((char *)v34 + 9);
  long long v24 = v33[1];
  _OWORD *v16 = v33[0];
  v16[1] = v24;
  long long v25 = v33[3];
  v16[2] = v33[2];
  v16[3] = v25;
  sub_185B18828((uint64_t)v35, (void (*)(void, void, void, void, void, void, void, void))sub_185636BB4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1858FDEB0);

  return v29;
}

- (UIShapeResolutionContext)init
{
  return (UIShapeResolutionContext *)sub_185B177D0((char *)self, (uint64_t)a2, &OBJC_IVAR___UIShapeResolutionContext_cachedContentShape, &OBJC_IVAR___UIShapeResolutionContext_value, (objc_class **)off_1E52D4708);
}

- (UIResolvedShape)contentShape
{
  v2 = self;
  v3 = sub_185B17914();

  return (UIResolvedShape *)v3;
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 72];
  v6[4] = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 56];
  v6[5] = v3;
  v7[0] = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 88];
  *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 97];
  long long v4 = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 8];
  v6[0] = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR___UIShapeResolutionContext_value);
  v6[1] = v4;
  long long v5 = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 40];
  v6[2] = *(_OWORD *)&self->value[OBJC_IVAR___UIShapeResolutionContext_value + 24];
  v6[3] = v5;
  sub_185B18828((uint64_t)v6, (void (*)(void, void, void, void, void, void, void, void))sub_185636BB4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1858FDEB0);
}

@end