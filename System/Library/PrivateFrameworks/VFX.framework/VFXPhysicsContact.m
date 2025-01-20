@interface VFXPhysicsContact
+ (id)_contactWithManifold:(const btPersistentManifold *)a3 index:(int64_t)a4;
- (BOOL)_shouldPostUpdate;
- (VFXNode)nodeA;
- (VFXNode)nodeB;
- (__n128)contactNormal;
- (__n128)contactPoint;
- (float)collisionImpulse;
- (float)penetrationDistance;
- (float)sweepTestFraction;
- (id)contactNormalValue;
- (id)contactPointValue;
- (id)description;
- (void)_fillNodeA:(VFXPhysicsContact *)self nodeB:(SEL)a2 contactPoint:(id)a3 collisionImpulse:(id)a4 distance:(float)a5 hitFraction:(float)a6;
- (void)_fillNodeA:(id)a3 nodeB:(id)a4;
- (void)_prepareUpdate;
- (void)_updateWithManifold:(const btPersistentManifold *)a3 index:(int64_t)a4 point:(const btManifoldPoint *)a5;
- (void)dealloc;
@end

@implementation VFXPhysicsContact

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXPhysicsContact;
  [(VFXPhysicsContact *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v8 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: %p", v7, v5, self);
  objc_msgSend_appendFormat_(v8, v9, @" '%@'", v10, self->_nodeA);
  objc_msgSend_appendFormat_(v8, v11, @" '%@'", v12, self->_nodeB);
  objc_msgSend_appendFormat_(v8, v13, @" point(%f %f %f)", v14, *(float *)self->_contactPoint, *(float *)&self->_contactPoint[4], *(float *)&self->_contactPoint[8]);
  objc_msgSend_appendFormat_(v8, v15, @" normal(%f %f %f)", v16, *(float *)self->_contactNormal, *(float *)&self->_contactNormal[4], *(float *)&self->_contactNormal[8]);
  objc_msgSend_appendFormat_(v8, v17, @" impulse(%f)", v18, self->_collisionImpulse);
  objc_msgSend_appendFormat_(v8, v19, @" distance:%f", v20, self->_distance);
  objc_msgSend_appendString_(v8, v21, @">", v22);
  return v8;
}

- (void)_fillNodeA:(VFXPhysicsContact *)self nodeB:(SEL)a2 contactPoint:(id)a3 collisionImpulse:(id)a4 distance:(float)a5 hitFraction:(float)a6
{
  float v8 = v7;
  float v9 = v6;
  long long v17 = *(_OWORD *)&a5;
  long long v18 = *(_OWORD *)&a6;
  nodeA = self->_nodeA;
  if (nodeA != a3)
  {
    if (nodeA)
    {
      CFRelease(nodeA);
      self->_nodeA = 0;
    }
    if (a3) {
      uint64_t v14 = (VFXNode *)CFRetain(a3);
    }
    else {
      uint64_t v14 = 0;
    }
    self->_nodeA = v14;
  }
  nodeB = self->_nodeB;
  if (nodeB != a4)
  {
    if (nodeB)
    {
      CFRelease(nodeB);
      self->_nodeB = 0;
    }
    if (a4) {
      uint64_t v16 = (VFXNode *)CFRetain(a4);
    }
    else {
      uint64_t v16 = 0;
    }
    self->_nodeB = v16;
  }
  *(_OWORD *)self->_contactPoint = v17;
  *(_OWORD *)self->_contactNormal = v18;
  self->_collisionImpulse = 0.0;
  self->_distance = v9;
  self->_fraction = v8;
}

- (void)_fillNodeA:(id)a3 nodeB:(id)a4
{
  nodeA = self->_nodeA;
  if (nodeA != a3)
  {
    if (nodeA)
    {
      CFRelease(nodeA);
      self->_nodeA = 0;
    }
    if (a3) {
      float v8 = (VFXNode *)CFRetain(a3);
    }
    else {
      float v8 = 0;
    }
    self->_nodeA = v8;
  }
  nodeB = self->_nodeB;
  if (nodeB != a4)
  {
    if (nodeB)
    {
      CFRelease(nodeB);
      self->_nodeB = 0;
    }
    if (a4) {
      uint64_t v10 = (VFXNode *)CFRetain(a4);
    }
    else {
      uint64_t v10 = 0;
    }
    self->_nodeB = v10;
  }
}

- (void)_updateWithManifold:(const btPersistentManifold *)a3 index:(int64_t)a4 point:(const btManifoldPoint *)a5
{
  var3 = a3->var3;
  if (var3 && (*((unsigned char *)var3 + 264) & 2) != 0 && (uint64_t v9 = *((void *)var3 + 67)) != 0) {
    uint64_t v10 = sub_1B6583674(*(id **)(v9 + 72));
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(void *)&a3->var4;
  if (v11 && (*(unsigned char *)(v11 + 264) & 2) != 0 && (uint64_t v12 = *(void *)(v11 + 536)) != 0) {
    v13 = sub_1B6583674(*(id **)(v12 + 72));
  }
  else {
    v13 = 0;
  }
  nodeA = self->_nodeA;
  if (nodeA != (VFXNode *)v10)
  {
    if (nodeA)
    {
      CFRelease(nodeA);
      self->_nodeA = 0;
    }
    if (v10) {
      v15 = (VFXNode *)CFRetain(v10);
    }
    else {
      v15 = 0;
    }
    self->_nodeA = v15;
  }
  nodeB = self->_nodeB;
  if (nodeB != (VFXNode *)v13)
  {
    if (nodeB)
    {
      CFRelease(nodeB);
      self->_nodeB = 0;
    }
    if (v13) {
      long long v17 = (VFXNode *)CFRetain(v13);
    }
    else {
      long long v17 = 0;
    }
    self->_nodeB = v17;
  }
  *(btVector3 *)self->_contactPoint = a5->var2;
  *(btVector3 *)self->_contactNormal = a5->var4;
  self->_collisionImpulse = a5->var15;
  self->_distance = -a5->var5;
}

+ (id)_contactWithManifold:(const btPersistentManifold *)a3 index:(int64_t)a4
{
  v4 = (char *)a3 + 192 * (int)a4;
  v5 = (void *)*((void *)v4 + 16);
  objc_msgSend__updateWithManifold_index_point_(v5, a2, (uint64_t)a3, a4, v4 + 16);
  return v5;
}

- (VFXNode)nodeA
{
  return self->_nodeA;
}

- (VFXNode)nodeB
{
  return self->_nodeB;
}

- (__n128)contactPoint
{
  return a1[2];
}

- (__n128)contactNormal
{
  return a1[3];
}

- (float)collisionImpulse
{
  return self->_collisionImpulse;
}

- (float)penetrationDistance
{
  return self->_distance;
}

- (float)sweepTestFraction
{
  return self->_fraction;
}

- (void)_prepareUpdate
{
}

- (BOOL)_shouldPostUpdate
{
  int64_t v2 = self->_updateCount - 1;
  self->_updateCount = v2;
  return v2 == 0;
}

- (id)contactPointValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_contactPoint(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_contactPoint(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  long long v18 = NSNumber;
  objc_msgSend_contactPoint(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

- (id)contactNormalValue
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v5 = NSNumber;
  objc_msgSend_contactNormal(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  uint64_t v10 = NSNumber;
  objc_msgSend_contactNormal(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  long long v18 = NSNumber;
  objc_msgSend_contactNormal(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v27, (uint64_t)v29, 3);
}

@end