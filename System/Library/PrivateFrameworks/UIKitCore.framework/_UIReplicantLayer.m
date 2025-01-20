@interface _UIReplicantLayer
- (_UISlotId)_slotId;
- (void)_setSlotId:(id)a3;
- (void)setContents:(id)a3;
@end

@implementation _UIReplicantLayer

- (void)setContents:(id)a3
{
  v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Snapshotting", &setContents____s_category) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Snapshot layer doesn't allow its contents to be set.", v4, 2u);
  }
}

- (void)_setSlotId:(id)a3
{
  v4 = (_UISlotId *)a3;
  v5 = [(_UISlotId *)v4 object];
  v7.receiver = self;
  v7.super_class = (Class)_UIReplicantLayer;
  [(_UIReplicantLayer *)&v7 setContents:v5];

  slotId = self->__slotId;
  self->__slotId = v4;
}

- (_UISlotId)_slotId
{
  return self->__slotId;
}

- (void).cxx_destruct
{
}

@end