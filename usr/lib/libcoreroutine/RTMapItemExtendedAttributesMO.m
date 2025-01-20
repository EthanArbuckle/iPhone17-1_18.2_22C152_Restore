@interface RTMapItemExtendedAttributesMO
+ (id)fetchRequest;
+ (id)managedObjectWithExtendedAttributes:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithExtendedAttributes:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation RTMapItemExtendedAttributesMO

+ (id)managedObjectWithExtendedAttributes:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithExtendedAttributes:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithExtendedAttributes:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (v7)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v19 = __Block_byref_object_copy__84;
      v20 = __Block_byref_object_dispose__84;
      id v21 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __106__RTMapItemExtendedAttributesMO_managedObjectWithExtendedAttributes_managedObject_inManagedObjectContext___block_invoke;
      v13[3] = &unk_1E6B91CA8;
      v17 = buf;
      id v14 = v8;
      id v15 = v9;
      id v16 = v7;
      [v15 performBlockAndWait:v13];
      id v10 = *(id *)(*(void *)&buf[8] + 40);

      _Block_object_dispose(buf, 8);
      goto LABEL_8;
    }
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "+[RTMapItemExtendedAttributesMO managedObjectWithExtendedAttributes:managedObject:inManagedObjectContext:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 31;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext (in %s:%d)", buf, 0x12u);
    }
  }
  id v10 = 0;
LABEL_8:

  return v10;
}

void __106__RTMapItemExtendedAttributesMO_managedObjectWithExtendedAttributes_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = *(RTMapItemExtendedAttributesMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[RTMapItemExtendedAttributesMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v4];

  v5 = [*(id *)(a1 + 48) addressIdentifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAddressIdentifier:v5];

  v6 = [NSNumber numberWithBool:[*(id *)(a1 + 48) isMe]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIsMe:v6];

  id v7 = NSNumber;
  [*(id *)(a1 + 48) wifiConfidence];
  id v8 = [v7 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWifiConfidence:v8];

  [NSNumber numberWithInteger:[*(id *)(a1 + 48) wifiFingerprintLabelType]];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWifiFingerprintLabelType:v9];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTMapItemExtendedAttributesMO"];
}

@end