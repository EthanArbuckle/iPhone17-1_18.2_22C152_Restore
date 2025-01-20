@interface RSGroupEdge
- (NSUUID)source_object_uuid;
- (NSUUID)target_object_uuid;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation RSGroupEdge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->target_object_uuid, 0);

  objc_storeStrong((id *)&self->source_object_uuid, 0);
}

- (NSUUID)target_object_uuid
{
  return self->target_object_uuid;
}

- (NSUUID)source_object_uuid
{
  return self->source_object_uuid;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(RSGroupEdge);
  objc_storeStrong((id *)&v4->source_object_uuid, self->source_object_uuid);
  objc_storeStrong((id *)&v4->target_object_uuid, self->target_object_uuid);
  return v4;
}

@end