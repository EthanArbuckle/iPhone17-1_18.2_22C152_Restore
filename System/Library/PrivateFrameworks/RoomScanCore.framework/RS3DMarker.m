@interface RS3DMarker
- (RS3DMarker)init;
- (RS3DMarker)initWithDictionary:(id)a3;
- (__n128)normal;
- (__n128)quad;
- (float)score;
- (id)dictionaryRepresentation;
@end

@implementation RS3DMarker

- (__n128)normal
{
  return a1[1];
}

- (float)score
{
  return self->_score;
}

- (__n128)quad
{
  return a1[2];
}

- (id)dictionaryRepresentation
{
  v28[4] = *MEMORY[0x263EF8340];
  v26[0] = @"quad";
  v4 = sub_25B51FA24(*(__n128 *)&self[1].super.isa, (uint64_t)self, a2, v2);
  v28[0] = v4;
  v7 = sub_25B51FA24(*(__n128 *)&self[1]._normal[4], (uint64_t)v4, v5, v6);
  v28[1] = v7;
  v10 = sub_25B51FA24(*(__n128 *)&self[2].super.isa, (uint64_t)v7, v8, v9);
  v28[2] = v10;
  v13 = sub_25B51FA24(*(__n128 *)&self[2]._normal[4], (uint64_t)v10, v11, v12);
  v28[3] = v13;
  v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v14, (uint64_t)v28, 4);

  v27[0] = v15;
  v26[1] = @"score";
  *(float *)&double v16 = self->_score;
  v19 = objc_msgSend_numberWithFloat_(NSNumber, v17, v18, v16);
  v27[1] = v19;
  v26[2] = @"normal";
  v22 = sub_25B51FA24(*(__n128 *)&self->_normal[4], (uint64_t)v19, v20, v21);
  v27[2] = v22;
  v24 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v23, (uint64_t)v27, v26, 3);

  return v24;
}

- (RS3DMarker)initWithDictionary:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)RS3DMarker;
  uint64_t v6 = [(RS3DMarker *)&v32 init];
  if (v6)
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v5, @"quad");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if (v8)
    {
      id v9 = v8;
      if (objc_msgSend_count(v9, v10, v11) == 4)
      {
        uint64_t v13 = 0;
        v14 = v6 + 32;
        while (1)
        {
          v15 = objc_msgSend_objectAtIndexedSubscript_(v9, v12, v13);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            break;
          }
          uint64_t v18 = objc_msgSend_objectAtIndexedSubscript_(v9, v17, v13);
          BOOL v19 = sub_25B51FDE8(v18, v14);

          if (!v19) {
            break;
          }
          ++v13;
          ++v14;
          if (v13 == 4)
          {

            objc_msgSend_objectForKeyedSubscript_(v4, v20, @"score");
            id v21 = (id)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v22 = v21;
            }
            else {
              id v22 = 0;
            }

            if (v22) {
              objc_msgSend_floatValue(v22, v24, v25);
            }
            else {
              int v26 = 0;
            }
            *((_DWORD *)v6 + 2) = v26;

            objc_msgSend_objectForKeyedSubscript_(v4, v27, @"normal");
            id v28 = (id)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v29 = v28;
            }
            else {
              id v29 = 0;
            }

            if (!v29) {
              goto LABEL_14;
            }
            BOOL v30 = sub_25B51FDE8(v29, (_OWORD *)v6 + 1);

            if (!v30) {
              goto LABEL_14;
            }
            goto LABEL_24;
          }
        }
      }
    }
LABEL_14:
    v23 = 0;
  }
  else
  {
LABEL_24:
    v23 = v6;
  }

  return v23;
}

- (RS3DMarker)init
{
  v3.receiver = self;
  v3.super_class = (Class)RS3DMarker;
  result = [(RS3DMarker *)&v3 init];
  if (result)
  {
    result->_score = 0.0;
    *(_OWORD *)&result->_normal[4] = 0u;
  }
  return result;
}

@end