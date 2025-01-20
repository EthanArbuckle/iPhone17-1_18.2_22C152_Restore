@interface RSRecessedArea
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RSRecessedArea

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->frontOpening, 0);
  objc_storeStrong((id *)&self->bayWindows, 0);

  objc_storeStrong((id *)&self->recessedWalls, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v7 = objc_msgSend_initWithArray_copyItems_(v5, v6, (uint64_t)self->recessedWalls, 1);
  v8 = (void *)v4[1];
  v4[1] = v7;

  id v9 = objc_alloc(MEMORY[0x263EFF8C0]);
  uint64_t v11 = objc_msgSend_initWithArray_copyItems_(v9, v10, (uint64_t)self->bayWindows, 1);
  v12 = (void *)v4[2];
  v4[2] = v11;

  uint64_t v15 = objc_msgSend_copy(self->frontOpening, v13, v14);
  v16 = (void *)v4[3];
  v4[3] = v15;

  return v4;
}

@end