void __MCMGetMCMContainerClassForContainerClass_block_invoke()
{
  uint64_t i;

  for (i = 0; i != 15; ++i)
    MCMGetMCMContainerClassForContainerClass_containerClassReverseMap[gMCMContainerClassToContainerClass[i]] = i;
}

id _containerClassForContentClass(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  switch(a1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      v3 = objc_opt_class();
      break;
    default:
      v2 = container_log_handle_for_category();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      {
        int v5 = 134217984;
        uint64_t v6 = a1;
        _os_log_fault_impl(&dword_226325000, v2, OS_LOG_TYPE_FAULT, "Invalid container content class %ld", (uint8_t *)&v5, 0xCu);
      }

      v3 = 0;
      break;
  }
  return v3;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x270EE5798]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x270EE57A8]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t container_class_normalized()
{
  return MEMORY[0x270ED8F60]();
}

uint64_t container_copy_info()
{
  return MEMORY[0x270ED8F68]();
}

uint64_t container_copy_info_value_for_key()
{
  return MEMORY[0x270ED8F70]();
}

uint64_t container_copy_path()
{
  return MEMORY[0x270ED8F80]();
}

uint64_t container_create_or_lookup_for_current_user()
{
  return MEMORY[0x270ED8F90]();
}

uint64_t container_delete_all_container_content()
{
  return MEMORY[0x270ED8FA8]();
}

uint64_t container_delete_array_of_containers()
{
  return MEMORY[0x270ED8FB8]();
}

uint64_t container_disk_usage()
{
  return MEMORY[0x270ED8FC0]();
}

uint64_t container_free_array_of_containers()
{
  return MEMORY[0x270ED8FE0]();
}

uint64_t container_free_object()
{
  return MEMORY[0x270ED8FE8]();
}

uint64_t container_get_all_with_class_for_current_user()
{
  return MEMORY[0x270ED8FF0]();
}

uint64_t container_get_class()
{
  return MEMORY[0x270ED8FF8]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x270ED9000]();
}

uint64_t container_get_persona_unique_string()
{
  return MEMORY[0x270ED9010]();
}

uint64_t container_get_uid()
{
  return MEMORY[0x270ED9018]();
}

uint64_t container_get_unique_path_component()
{
  return MEMORY[0x270ED9020]();
}

uint64_t container_is_transient()
{
  return MEMORY[0x270ED9028]();
}

uint64_t container_log_handle_for_category()
{
  return MEMORY[0x270ED9030]();
}

uint64_t container_object_create()
{
  return MEMORY[0x270ED9038]();
}

uint64_t container_object_get_class()
{
  return MEMORY[0x270ED9040]();
}

uint64_t container_object_get_identifier()
{
  return MEMORY[0x270ED9048]();
}

uint64_t container_object_get_uuid()
{
  return MEMORY[0x270ED9050]();
}

uint64_t container_recreate_structure()
{
  return MEMORY[0x270ED90D0]();
}

uint64_t container_regenerate_uuid()
{
  return MEMORY[0x270ED90D8]();
}

uint64_t container_replace()
{
  return MEMORY[0x270ED90E0]();
}

uint64_t container_set_info_value()
{
  return MEMORY[0x270ED90E8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x270EDA4B8](__s, __smax, *(void *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void uuid_clear(uuid_t uu)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x270EDBA28](uu);
}