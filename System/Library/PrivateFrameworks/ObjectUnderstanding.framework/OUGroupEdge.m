@interface OUGroupEdge
- (NSUUID)source_object_uuid;
- (NSUUID)target_object_uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setSource_object_uuid:(id)a3;
- (void)setTarget_object_uuid:(id)a3;
@end

@implementation OUGroupEdge

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(OUGroupEdge);
  objc_storeStrong((id *)&v4->source_object_uuid, self->source_object_uuid);
  objc_storeStrong((id *)&v4->target_object_uuid, self->target_object_uuid);
  return v4;
}

- (NSUUID)source_object_uuid
{
  return self->source_object_uuid;
}

- (void)setSource_object_uuid:(id)a3
{
}

- (NSUUID)target_object_uuid
{
  return self->target_object_uuid;
}

- (void)setTarget_object_uuid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->target_object_uuid, 0);
  objc_storeStrong((id *)&self->source_object_uuid, 0);
}

@end