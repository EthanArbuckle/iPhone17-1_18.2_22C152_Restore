@interface BoxedPhysicsShape
+ (id)boxPhysicsShape:;
+ (id)boxPhysicsShape:(PKPhysicsShape *)a3;
+ (uint64_t)boxPhysicsShape:;
+ (void)boxPhysicsShape:;
- (PKPhysicsShape)unboxShape;
@end

@implementation BoxedPhysicsShape

+ (id)boxPhysicsShape:(PKPhysicsShape *)a3
{
  v39[4] = *MEMORY[0x263EF8340];
  v4 = objc_alloc_init(BoxedPhysicsShape);
  var0 = a3->var0.var0;
  int v6 = *((_DWORD *)a3->var0.var0 + 2);
  v4->shapeType = v6;
  switch(v6)
  {
    case 0:
    case 1:
      LODWORD(v7) = 2;
      break;
    case 2:
    case 3:
      uint64_t v7 = (*((void *)var0 + 3) - *((void *)var0 + 2)) >> 3;
      break;
    case 4:
      LODWORD(v7) = QuadTree::leafCount(*((QuadTree **)var0 + 2));
      break;
    default:
      LODWORD(v7) = 1;
      break;
  }
  v8 = [MEMORY[0x263EFF980] arrayWithCapacity:(int)v7];
  objc_storeStrong((id *)&v4->points, v8);
  switch(v6)
  {
    case 0:
      float v9 = *((float *)var0 + 4);
      float v10 = PKGet_PTM_RATIO();
      float v11 = *((float *)var0 + 5);
      v41.y = (float)(v11 * PKGet_PTM_RATIO());
      v41.x = (float)(v9 * v10);
      v12 = valueWithCGPoint(v41);
      [v8 addObject:v12];

      float v13 = *((float *)var0 + 3);
      v42.x = (float)(v13 * PKGet_PTM_RATIO());
      v42.y = 0.0;
      v14 = valueWithCGPoint(v42);
      [v8 addObject:v14];
      goto LABEL_19;
    case 1:
      float v31 = *((float *)var0 + 4);
      float v32 = PKGet_PTM_RATIO();
      float v33 = *((float *)var0 + 5);
      v45.y = (float)(v33 * PKGet_PTM_RATIO());
      v45.x = (float)(v31 * v32);
      v34 = valueWithCGPoint(v45);
      [v8 addObject:v34];

      float v35 = *((float *)var0 + 6);
      float v36 = PKGet_PTM_RATIO();
      float v37 = *((float *)var0 + 7);
      v46.y = (float)(v37 * PKGet_PTM_RATIO());
      v46.x = (float)(v35 * v36);
      v14 = valueWithCGPoint(v46);
      [v8 addObject:v14];
LABEL_19:

      break;
    case 2:
      uint64_t v16 = *((void *)var0 + 2);
      uint64_t v17 = *((void *)var0 + 3) - v16;
      if ((int)((unint64_t)v17 >> 3) >= 1)
      {
        uint64_t v18 = 0;
        unint64_t v19 = 0;
        do
        {
          if (v19 >= v17 >> 3) {
            __assert_rtn("GetVertex", "b2PolygonShape.h", 97, "0 <= index && index < m_vertices.size()");
          }
          float v20 = *(float *)(v16 + v18);
          float v21 = PKGet_PTM_RATIO();
          float v22 = *(float *)(v16 + v18 + 4);
          v43.y = (float)(v22 * PKGet_PTM_RATIO());
          v43.x = (float)(v20 * v21);
          v23 = valueWithCGPoint(v43);
          [v8 addObject:v23];

          ++v19;
          uint64_t v16 = *((void *)var0 + 2);
          uint64_t v17 = *((void *)var0 + 3) - v16;
          v18 += 8;
        }
        while ((uint64_t)v19 < (int)((unint64_t)v17 >> 3));
      }
      break;
    case 3:
      uint64_t v24 = (*((void *)var0 + 3) - *((void *)var0 + 2)) >> 3;
      if ((int)v24 >= 1)
      {
        int v25 = 0;
        do
        {
          Vertex = (float *)b2ChainShape::GetVertex((b2ChainShape *)var0, v25);
          float v27 = *Vertex;
          float v28 = PKGet_PTM_RATIO();
          float v29 = Vertex[1];
          v44.y = (float)(v29 * PKGet_PTM_RATIO());
          v44.x = (float)(v27 * v28);
          v30 = valueWithCGPoint(v44);
          [v8 addObject:v30];

          ++v25;
        }
        while (v24 != v25);
      }
      break;
    case 4:
      v15 = (void **)*((void *)var0 + 2);
      v39[0] = &unk_26C3F4078;
      v39[1] = v8;
      v39[3] = v39;
      QuadTree::visitLeaves(v15, (uint64_t)v39);
      std::__function::__value_func<void ()(float,float,int)>::~__value_func[abi:ne180100](v39);
      break;
    default:
      break;
  }

  return v4;
}

- (PKPhysicsShape)unboxShape
{
  return 0;
}

- (void).cxx_destruct
{
}

+ (uint64_t)boxPhysicsShape:
{
    return a1 + 8;
  else {
    return 0;
  }
}

+ (void)boxPhysicsShape:
{
}

+ (id)boxPhysicsShape:
{
  *a2 = &unk_26C3F4078;
  id result = *(id *)(a1 + 8);
  a2[1] = result;
  return result;
}

@end