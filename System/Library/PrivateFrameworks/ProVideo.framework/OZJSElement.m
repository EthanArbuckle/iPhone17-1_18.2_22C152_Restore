@interface OZJSElement
+ (id)elementWithElement:(void *)a3;
- (OZJSElement)initWithElement:(void *)a3;
- (SCNVector3)getPosition;
- (SCNVector3)getPositionAtTime:(float)a3;
- (float)getEndTime;
- (float)getStartTime;
- (float)time;
- (id)getBehaviorWithName:(id)a3;
- (id)name;
- (unsigned)ID;
- (void)clone;
- (void)cloneAtTime:(float)a3;
- (void)disable;
- (void)element;
- (void)enable;
- (void)setElement:(void *)a3;
- (void)setPosition:(SCNVector3)a3;
- (void)setRotation:(OZJSElement *)self;
- (void)setStartTime:(float)a3;
- (void)setTime:(float)a3;
@end

@implementation OZJSElement

+ (id)elementWithElement:(void *)a3
{
  v3 = [[OZJSElement alloc] initWithElement:a3];

  return v3;
}

- (OZJSElement)initWithElement:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)OZJSElement;
  result = [(OZJSElement *)&v5 init];
  if (result) {
    result->_element = a3;
  }
  return result;
}

- (void)setRotation:(OZJSElement *)self
{
  OZTransformNode::setRotation((OZTransformNode *)self->_element, *(float *)&v2, *((float *)&v2 + 1), *((float *)&v2 + 2), MEMORY[0x1E4F1FA48]);
}

- (void)setPosition:(SCNVector3)a3
{
}

- (void)setStartTime:(float)a3
{
  memset(&v4, 0, sizeof(v4));
  PC_CMTimeMakeWithSecondsRoundToNearest(30, &v4, a3);
  (*(void (**)(void))(*(void *)self->_element + 1160))();
}

- (float)getStartTime
{
  (*(void (**)(CMTime *__return_ptr))(*(void *)self->_element + 1128))(&v4);
  CMTime v3 = v4;
  return CMTimeGetSeconds(&v3);
}

- (float)getEndTime
{
  (*(void (**)(CMTime *__return_ptr))(*(void *)self->_element + 1128))(v6);
  CMTime v7 = v6[0];
  memset(&v5, 0, sizeof(v5));
  (*(void (**)(CMTime *__return_ptr))(*(void *)self->_element + 1128))(v6);
  CMTime v8 = v6[1];
  CMTime v9 = v7;
  PC_CMTimeSaferAdd(&v9, &v8, (uint64_t)&v5);
  CMTime v4 = v5;
  return CMTimeGetSeconds(&v4);
}

- (SCNVector3)getPosition
{
  [(OZJSElement *)self getPositionAtTime:0.0];
  result.z = v4;
  result.y = v3;
  result.x = v2;
  return result;
}

- (SCNVector3)getPositionAtTime:(float)a3
{
  memset(&v10, 0, sizeof(v10));
  PC_CMTimeMakeWithSecondsRoundToNearest(30, &v10, a3);
  double v7 = 0.0;
  double v8 = 0.0;
  double v9 = 0.0;
  OZTransformNode::getTranslation((OZTransformNode *)self->_element, &v7, &v8, &v9, &v10);
  float v4 = v7;
  float v5 = v8;
  float v6 = v9;
  result.z = v6;
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)enable
{
}

- (void)disable
{
}

- (unsigned)ID
{
  return *((_DWORD *)self->_element + 20);
}

- (id)name
{
  Name = (PCString *)OZObjectManipulator::getName((OZObjectManipulator *)((char *)self->_element + 16));

  return PCString::ns_str(Name);
}

- (void)clone
{
}

- (void)cloneAtTime:(float)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = *(void *)"";
  v3[2] = __27__OZJSElement_cloneAtTime___block_invoke;
  v3[3] = &unk_1E616DE28;
  v3[4] = self;
  float v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __27__OZJSElement_cloneAtTime___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(*(void *)(a1 + 32) + 16) + 272))(*(void *)(*(void *)(a1 + 32) + 16));
  if (result)
  {
    float v3 = (OZScene *)result;
    printf("[AR]\t\tOZJavaScript clone: cloning %u\n", [*(id *)(a1 + 32) ID]);
    OZScene::clearSelection(v3);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
    if (v4) {
      float v5 = (OZObjectManipulator *)(v4 + 16);
    }
    else {
      float v5 = 0;
    }
    OZScene::selectObject(v3, v5, 0, 0);
    OZScene::duplicateSelected(v3);
    OZScene::begin_all_sel(v3, (uint64_t)v19);
    OZScene::end_all_sel(v3, (uint64_t)v15);
    if (v22 == v17[2])
    {
      if (v22 < 2)
      {
        double v7 = (uint64_t *)v15;
        float v6 = v19;
      }
      else if (v22 == 3)
      {
        float v6 = &v21;
        double v7 = (uint64_t *)v17;
      }
      else
      {
        if (v22 != 2) {
          goto LABEL_24;
        }
        float v6 = &v20;
        double v7 = &v16;
      }
      if (*v6 == *v7) {
        goto LABEL_24;
      }
    }
    if (v22 < 2)
    {
      uint64_t v8 = v19[0];
      if (v19[0] == v19[2]) {
        goto LABEL_24;
      }
    }
    else
    {
      if (v22 == 2)
      {
        uint64_t v11 = *(void *)(v20 + 16);
        if (v11)
        {
          CMTime v10 = (const void *)(v11 + 48);
LABEL_22:
          if (v12)
          {
            v13 = v12;
            memset(&v14, 0, sizeof(v14));
            PC_CMTimeMakeWithSecondsRoundToNearest(30, &v14, *(float *)(a1 + 40));
            (*(void (**)(void *, CMTime *))(*(void *)v13 + 1160))(v13, &v14);
          }
        }
LABEL_24:
        std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)&v18);
        return std::__hash_table<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::__unordered_map_hasher<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::hash<OZSceneNode *>,std::equal_to<OZSceneNode *>,true>,std::__unordered_map_equal<OZSceneNode *,std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>,std::equal_to<OZSceneNode *>,std::hash<OZSceneNode *>,true>,std::allocator<std::__hash_value_type<OZSceneNode *,std::__list_iterator<OZSceneNode *,void *>>>>::~__hash_table((uint64_t)&v23);
      }
      if (v22 != 3) {
        goto LABEL_24;
      }
      uint64_t v8 = v21;
    }
    uint64_t v9 = *(void *)(v8 + 16);
    if (v9)
    {
      CMTime v10 = (const void *)(v9 + 16);
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  return result;
}

- (id)getBehaviorWithName:(id)a3
{
  element = self->_element;
  uint64_t v4 = (char *)(element + 125);
  float v5 = (char *)element[126];
  if (v5 == (char *)(element + 125)) {
    return 0;
  }
  while (1)
  {
    Name = (PCString *)OZObjectManipulator::getName((OZObjectManipulator *)(*((void *)v5 + 2) + 16));
    v9.var0 = 0;
    PCString::set(&v9, (CFStringRef)a3);
    LODWORD(Name) = PCString::compare(Name, &v9);
    PCString::~PCString(&v9);
    if (!Name) {
      break;
    }
    float v5 = (char *)*((void *)v5 + 1);
    if (v5 == v4) {
      return 0;
    }
  }
  if (v5 == v4) {
    return 0;
  }
  else {
    return +[OZJSBehavior behaviorWithBehavior:*((void *)v5 + 2)];
  }
}

- (void)element
{
  return self->_element;
}

- (void)setElement:(void *)a3
{
  self->_element = a3;
}

- (float)time
{
  return self->_time;
}

- (void)setTime:(float)a3
{
  self->_time = a3;
}

@end