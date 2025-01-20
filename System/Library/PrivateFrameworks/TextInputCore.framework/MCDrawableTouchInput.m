@interface MCDrawableTouchInput
- (BOOL)isInflectionPoint;
- (MCDrawableTouchInput)initWithTouchPoint:(CGPoint)a3 radius:(double)a4 timestamp:(double)a5;
- (MCDrawableTouchInput)initWithTouchPoint:(CGPoint)a3 radius:(double)a4 timestamp:(double)a5 inflectionPoint:(BOOL)a6 touchHistory:(const void *)a7;
- (NSArray)nearbyKeys;
- (RefPtr<TI::Favonius::CMTouchHistory>)touchHistory;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation MCDrawableTouchInput

- (id).cxx_construct
{
  *((void *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  m_ptr = self->_touchHistory.m_ptr;
  if (m_ptr)
  {
    unsigned int v4 = atomic_load((unsigned int *)m_ptr + 2);
    if (v4 == 1) {
      (*(void (**)(CMTouchHistory *, SEL))(*(void *)m_ptr + 8))(m_ptr, a2);
    }
    else {
      atomic_fetch_add((atomic_uint *volatile)m_ptr + 2, 0xFFFFFFFF);
    }
  }

  objc_storeStrong((id *)&self->_nearbyKeys, 0);
}

- (RefPtr<TI::Favonius::CMTouchHistory>)touchHistory
{
  m_ptr = self->_touchHistory.m_ptr;
  *v2 = m_ptr;
  if (m_ptr) {
    atomic_fetch_add((atomic_uint *volatile)m_ptr + 2, 1u);
  }
  return (RefPtr<TI::Favonius::CMTouchHistory>)self;
}

- (NSArray)nearbyKeys
{
  return self->_nearbyKeys;
}

- (BOOL)isInflectionPoint
{
  return self->_isInflectionPoint;
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)MCDrawableTouchInput;
  v3 = [(MCTouchInput *)&v18 description];
  unsigned int v4 = [MEMORY[0x1E4F28E78] string];
  [v4 appendString:@"{"];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(MCDrawableTouchInput *)self nearbyKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    char v9 = 1;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((v9 & 1) == 0) {
          [v4 appendString:@", "];
        }
        objc_msgSend(v4, "appendFormat:", @"%c", objc_msgSend(v11, "character"));
        char v9 = 0;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      char v9 = 0;
    }
    while (v7);
  }

  [v4 appendString:@"}"];
  id v12 = (id)[v3 stringByAppendingFormat:@", nearbyKeys=%@", v4];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MCDrawableTouchInput;
  unsigned int v4 = [(MCTouchInput *)&v9 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 64) = self->_isInflectionPoint;
    uint64_t v6 = v4[10];
    v5[10] = 0;
    if (v6)
    {
      unsigned int v7 = atomic_load(v6 + 2);
      if (v7 == 1) {
        (*(void (**)(unsigned int *))(*(void *)v6 + 8))(v6);
      }
      else {
        atomic_fetch_add((atomic_uint *volatile)v6 + 2, 0xFFFFFFFF);
      }
    }
    objc_storeStrong((id *)v5 + 9, self->_nearbyKeys);
  }
  return v5;
}

- (MCDrawableTouchInput)initWithTouchPoint:(CGPoint)a3 radius:(double)a4 timestamp:(double)a5 inflectionPoint:(BOOL)a6 touchHistory:(const void *)a7
{
  v19.receiver = self;
  v19.super_class = (Class)MCDrawableTouchInput;
  objc_super v9 = -[MCTouchInput initWithTouchPoint:radius:timestamp:](&v19, sel_initWithTouchPoint_radius_timestamp_, a3.x, a3.y, a4, a5);
  v10 = v9;
  if (v9)
  {
    v9->_isInflectionPoint = a6;
    uint64_t v11 = *(void *)a7;
    if (*(void *)a7) {
      atomic_fetch_add((atomic_uint *volatile)(v11 + 8), 1u);
    }
    m_ptr = (unsigned int *)v9->_touchHistory.m_ptr;
    v10->_touchHistory.m_ptr = (CMTouchHistory *)v11;
    if (m_ptr)
    {
      unsigned int v13 = atomic_load(m_ptr + 2);
      if (v13 == 1) {
        (*(void (**)(unsigned int *))(*(void *)m_ptr + 8))(m_ptr);
      }
      else {
        atomic_fetch_add((atomic_uint *volatile)m_ptr + 2, 0xFFFFFFFF);
      }
    }
    uint64_t v14 = *(void *)a7;
    if (v14)
    {
      long long v15 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v14 + 64))(v14);
      unint64_t v16 = [(id)objc_opt_class() maxNearbyKeysCountDefault];
      long long v17 = asMCNearbyKeys(v15, v16);
    }
    else
    {
      long long v17 = 0;
    }
    objc_storeStrong((id *)&v10->_nearbyKeys, v17);
    if (v14) {
  }
    }
  return v10;
}

- (MCDrawableTouchInput)initWithTouchPoint:(CGPoint)a3 radius:(double)a4 timestamp:(double)a5
{
}

@end