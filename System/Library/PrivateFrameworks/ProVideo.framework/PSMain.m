@interface PSMain
- (BOOL)canAddEmitterToDoc:(void *)a3;
- (BOOL)validateAction:(SEL)a3;
- (PSMain)init;
@end

@implementation PSMain

- (PSMain)init
{
  v49.receiver = self;
  v49.super_class = (Class)PSMain;
  v2 = [(PSMain *)&v49 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = theApp;
    Instance = (OZFactory *)PSEmitter_Factory::getInstance((PSEmitter_Factory *)v2);
    v6 = (PSParticleType_Factory *)OZFactories::addFactory(*(uint64_t ***)(v4 + 32), Instance);
    uint64_t v7 = theApp;
    v8 = (OZFactory *)PSParticleType_Factory::getInstance(v6);
    v9 = (PSReplicator_Factory *)OZFactories::addFactory(*(uint64_t ***)(v7 + 32), v8);
    uint64_t v10 = theApp;
    v11 = (OZFactory *)PSReplicator_Factory::getInstance(v9);
    v12 = (PSReplicatorPType_Factory *)OZFactories::addFactory(*(uint64_t ***)(v10 + 32), v11);
    uint64_t v13 = theApp;
    v14 = (OZFactory *)PSReplicatorPType_Factory::getInstance(v12);
    v15 = (PSPaint_Factory *)OZFactories::addFactory(*(uint64_t ***)(v13 + 32), v14);
    uint64_t v16 = theApp;
    v17 = (OZFactory *)PSPaint_Factory::getInstance(v15);
    v18 = (PSPaintPType_Factory *)OZFactories::addFactory(*(uint64_t ***)(v16 + 32), v17);
    uint64_t v19 = theApp;
    v20 = (OZFactory *)PSPaintPType_Factory::getInstance(v18);
    v21 = (PSEmitterMoToFoBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v19 + 32), v20);
    uint64_t v22 = theApp;
    v23 = (OZFactory *)PSEmitterMoToFoBehavior_Factory::getInstance(v21);
    v24 = (PSScaleOverLifeBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v22 + 32), v23);
    uint64_t v25 = theApp;
    v26 = (OZFactory *)PSScaleOverLifeBehavior_Factory::getInstance(v24);
    v27 = (PSSequenceBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v25 + 32), v26);
    uint64_t v28 = theApp;
    v29 = (OZFactory *)PSSequenceBehavior_Factory::getInstance(v27);
    v30 = (PSPaintSequenceBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v28 + 32), v29);
    uint64_t v31 = theApp;
    v32 = (OZFactory *)PSPaintSequenceBehavior_Factory::getInstance(v30);
    v33 = (PSSpinOverLifeBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v31 + 32), v32);
    uint64_t v34 = theApp;
    v35 = (OZFactory *)PSSpinOverLifeBehavior_Factory::getInstance(v33);
    v36 = (PSPenPropertyBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v34 + 32), v35);
    uint64_t v37 = theApp;
    v38 = (OZFactory *)PSPenPropertyBehavior_Factory::getInstance(v36);
    v39 = (PSPenPressureBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v37 + 32), v38);
    uint64_t v40 = theApp;
    v41 = (OZFactory *)PSPenPressureBehavior_Factory::getInstance(v39);
    v42 = (PSPenSpeedBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v40 + 32), v41);
    uint64_t v43 = theApp;
    v44 = (OZFactory *)PSPenSpeedBehavior_Factory::getInstance(v42);
    v45 = (PSPenTiltBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v43 + 32), v44);
    uint64_t v46 = theApp;
    v47 = (OZFactory *)PSPenTiltBehavior_Factory::getInstance(v45);
    OZFactories::addFactory(*(uint64_t ***)(v46 + 32), v47);
  }
  return v3;
}

- (BOOL)canAddEmitterToDoc:(void *)a3
{
  if (a3)
  {
    v3 = (OZScene *)*((void *)a3 + 3);
    OZScene::begin_sel(v3, (uint64_t)v16);
    OZScene::end_sel(v3, (uint64_t)v14);
    uint64_t v4 = 0;
    char v5 = 0;
    char v6 = 1;
    while (v16[0] != v14[0])
    {
      if (v16[0] == v16[2])
      {
        uint64_t v7 = 0;
      }
      else
      {
        uint64_t v7 = *(const void **)(v16[0] + 16);
        if (v7
        {
          goto LABEL_20;
        }
      }
      if ((OZSceneNode::isDescendantOf360Group((uint64_t)v7) & 1) != 0 {
        || ((v8 = *(void **)(v16[0] + 16)) == 0
      }
          ? (v9 = 0)
      {
LABEL_20:
        char v12 = 0;
        goto LABEL_23;
      }
      v5 |= v9 != 0;
      OZObject::iterator_t<OZSceneNode,true,true,OZObject::defaultValidator>::operator++(v16);
      char v6 = 0;
      uint64_t v4 = v10;
    }
    char v12 = (v6 ^ 1) & v5;
LABEL_23:
    std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)&v15);
    std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)&v17);
  }
  else
  {
    char v12 = 0;
  }
  return v12 & 1;
}

- (BOOL)validateAction:(SEL)a3
{
  return 0;
}

@end