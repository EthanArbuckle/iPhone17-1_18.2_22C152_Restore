@interface VKRouteAnnotation
- (GEOMiniCard)infoCard;
- (GEOStyleAttributes)_originalStyleAttributes;
- (VKRouteAnnotation)initWithRouteAnnotation:(id)a3 onRoute:(id)a4;
- (void)populateDebugNode:(void *)a3;
@end

@implementation VKRouteAnnotation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->super._routeLegWhen._value, 0);
  objc_storeStrong((id *)&self->super._routeLegWhen, 0);
}

- (GEOStyleAttributes)_originalStyleAttributes
{
  return *(GEOStyleAttributes **)&self->super._routeLegWhen._value.type;
}

- (void)populateDebugNode:(void *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)VKRouteAnnotation;
  -[VKTrafficFeature populateDebugNode:](&v38, sel_populateDebugNode_);
  *((unsigned char *)&__p.__r_.__value_.__s + 23) = 15;
  strcpy((char *)&__p, "StyleAttributes");
  ChildNode = gdc::DebugTreeNode::createChildNode((uint64_t)a3, (long long *)&__p);
  gdc::DebugTreeNode::DebugTreeNode(&v31, (const gdc::DebugTreeNode *)ChildNode);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v6 = [*(id *)&self->super._routeLegWhen._value.type attributes];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v39 count:16];
  if (v7)
  {
    int v8 = 0;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        std::to_string(&v25, v8 + i);
        v12 = std::string::insert(&v25, 0, "Attribute: ", 0xBuLL);
        std::string __p = *v12;
        v12->__r_.__value_.__l.__size_ = 0;
        v12->__r_.__value_.__r.__words[2] = 0;
        v12->__r_.__value_.__r.__words[0] = 0;
        unsigned int v13 = [v11 key];
        unsigned int v14 = [v11 value];
        v23 = 0;
        v15 = (char *)operator new(0x80uLL);
        v23 = v15 + 128;
        v24 = v15 + 128;
        *((void *)v15 + 1) = v13;
        *((void *)v15 + 5) = 0;
        *((void *)v15 + 6) = 0;
        *((void *)v15 + 4) = 0;
        *((_DWORD *)v15 + 14) = 1;
        *((void *)v15 + 12) = 0;
        *((void *)v15 + 9) = v14;
        *((void *)v15 + 13) = 0;
        *((void *)v15 + 14) = 0;
        *((_DWORD *)v15 + 30) = 1;
        v22 = v15;
        gdc::DebugTreeNode::addProperty((uint64_t)&v31, (uint64_t)&__p, (uint64_t *)&v22);
        if (v15[119] < 0)
        {
          operator delete(*((void **)v15 + 12));
          if ((v15[55] & 0x80000000) == 0) {
            goto LABEL_10;
          }
        }
        else if ((v15[55] & 0x80000000) == 0)
        {
          goto LABEL_10;
        }
        operator delete(*((void **)v15 + 4));
LABEL_10:
        operator delete(v15);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(__p.__r_.__value_.__l.__data_);
          if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            continue;
          }
        }
        else if ((SHIBYTE(v25.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
          continue;
        }
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v39 count:16];
      v8 += i;
    }
    while (v7);
  }

  v16 = v36;
  if (v36)
  {
    uint64_t v17 = (uint64_t)v37;
    v18 = v36;
    if (v37 != v36)
    {
      do
      {
        v17 -= 80;
        std::__destroy_at[abi:nn180100]<gdc::DebugTreeProperty,0>(v17);
      }
      while ((void *)v17 != v16);
      v18 = v36;
    }
    v37 = v16;
    operator delete(v18);
  }
  v19 = v34;
  if (v34)
  {
    uint64_t v20 = (uint64_t)v35;
    v21 = v34;
    if (v35 != v34)
    {
      do
      {
        v20 -= 96;
        std::allocator_traits<std::allocator<gdc::DebugTreeNode>>::destroy[abi:nn180100]<gdc::DebugTreeNode,void,void>(v20);
      }
      while ((void *)v20 != v19);
      v21 = v34;
    }
    v35 = v19;
    operator delete(v21);
  }
  if ((v33 & 0x80000000) == 0)
  {
    if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      return;
    }
LABEL_30:
    operator delete(v31.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(v32);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    goto LABEL_30;
  }
}

- (GEOMiniCard)infoCard
{
  return (GEOMiniCard *)[*(id *)&self->super._routeLegWhen._hasValue infoCard];
}

- (VKRouteAnnotation)initWithRouteAnnotation:(id)a3 onRoute:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)VKRouteAnnotation;
  uint64_t v9 = [(VKTrafficFeature *)&v21 initWithEnrouteNotice:v7 onRoute:v8];
  v10 = v9;
  v11 = 0;
  if (v7)
  {
    if (v9)
    {
      v11 = [v7 artwork];
      if (v11)
      {
        v12 = [v7 artwork];
        if ([v12 hasIcon])
        {
          unsigned int v13 = [v7 artwork];
          unsigned int v14 = [v13 icon];
          char v15 = [v14 hasStyleAttributes];

          if (v15)
          {
            v16 = [v7 artwork];
            uint64_t v17 = [v16 icon];
            uint64_t v18 = [v17 styleAttributes];
            double type = v10->super._routeLegWhen._value.type;
            *(void *)&v10->super._routeLegWhen._value.double type = v18;

            objc_storeStrong((id *)&v10->super._routeLegWhen, a3);
            v11 = v10;
            goto LABEL_9;
          }
        }
        else
        {
        }
        v11 = 0;
      }
    }
  }
LABEL_9:

  return v11;
}

@end