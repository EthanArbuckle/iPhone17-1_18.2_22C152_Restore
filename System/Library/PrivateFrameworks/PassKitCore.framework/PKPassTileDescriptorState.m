@interface PKPassTileDescriptorState
- (BOOL)isEqualToUnresolvedState:(id)a3;
- (BOOL)isInProgress;
- (BOOL)isSupported;
- (NSString)stateIdentifier;
- (PKPassTileDescriptorState)init;
- (PKPassTileState)stateOverride;
- (id)initForType:(int64_t)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unint64_t)isEnabled;
- (void)_copyInto:(uint64_t)a1;
@end

@implementation PKPassTileDescriptorState

- (PKPassTileDescriptorState)init
{
  return 0;
}

- (id)initForType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileDescriptorState;
  id result = [(PKPassTileDescriptorState *)&v5 init];
  if (result)
  {
    *((unsigned char *)result + 8) = a3 != 1;
    *((void *)result + 2) = a3;
    *((void *)result + 3) = 0;
  }
  return result;
}

- (void)_copyInto:(uint64_t)a1
{
  if (a1)
  {
    *(unsigned char *)(a2 + 8) = *(unsigned char *)(a1 + 8);
    *(void *)(a2 + 24) = *(void *)(a1 + 24);
    objc_storeStrong((id *)(a2 + 32), *(id *)(a1 + 32));
    v4 = (id *)(id)a2;
    objc_storeStrong(v4 + 5, *(id *)(a1 + 40));
    *((unsigned char *)v4 + 9) = *(unsigned char *)(a1 + 9);
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [(PKPassTileDescriptorState *)[PKMutablePassTileDescriptorState alloc] initForType:self->_type];
  -[PKPassTileDescriptorState _copyInto:]((uint64_t)self, (uint64_t)v4);
  return v4;
}

- (BOOL)isEqualToUnresolvedState:(id)a3
{
  id v4 = (id *)a3;
  objc_super v5 = v4;
  if (v4[2] != self->_type || *((unsigned __int8 *)v4 + 8) != self->_supported || v4[3] != self->_enabled) {
    goto LABEL_16;
  }
  stateIdentifier = self->_stateIdentifier;
  v7 = (NSString *)v4[4];
  v8 = stateIdentifier;
  if (v7 == v8)
  {
  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_16;
    }
    BOOL v10 = [(NSString *)v7 isEqualToString:v8];

    if (!v10) {
      goto LABEL_16;
    }
  }
  id v11 = v5[5];
  stateOverride = self->_stateOverride;
  if (v11)
  {
    if (!stateOverride || (objc_msgSend(v11, "isEqualToUnresolvedState:") & 1) == 0) {
      goto LABEL_16;
    }
LABEL_18:
    BOOL v13 = *((unsigned __int8 *)v5 + 9) == self->_inProgress;
    goto LABEL_17;
  }
  if (!stateOverride) {
    goto LABEL_18;
  }
LABEL_16:
  BOOL v13 = 0;
LABEL_17:

  return v13;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (unint64_t)isEnabled
{
  return self->_enabled;
}

- (NSString)stateIdentifier
{
  return self->_stateIdentifier;
}

- (PKPassTileState)stateOverride
{
  return self->_stateOverride;
}

- (BOOL)isInProgress
{
  return self->_inProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateOverride, 0);
  objc_storeStrong((id *)&self->_stateIdentifier, 0);
}

@end