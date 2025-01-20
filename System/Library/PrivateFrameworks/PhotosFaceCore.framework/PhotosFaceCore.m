void PFCRectForTimePosition(uint64_t a1)
{
  CGFloat *v1;
  CGFloat *v2;
  CGFloat *v3;
  CGFloat *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGRect v11;

  v1 = (CGFloat *)(MEMORY[0x263F001A8] + 8);
  v2 = (CGFloat *)(MEMORY[0x263F001A8] + 16);
  v3 = (CGFloat *)(MEMORY[0x263F001A8] + 24);
  v4 = (CGFloat *)((char *)&unk_259333600 + 8 * a1 - 8);
  if ((unint64_t)(a1 - 1) > 7)
  {
    v4 = (CGFloat *)MEMORY[0x263F001A8];
  }
  else
  {
    v3 = (CGFloat *)((char *)&unk_259333540 + 8 * a1 - 8);
    v2 = (CGFloat *)((char *)&unk_259333580 + 8 * a1 - 8);
    v1 = (CGFloat *)((char *)&unk_2593335C0 + 8 * a1 - 8);
  }
  v5 = *v4;
  v6 = *v1;
  v7 = *v2;
  v8 = *v3;
  memset(&v10, 0, sizeof(v10));
  CGAffineTransformMakeScale(&v10, 0.00308641975, 0.00253807107);
  v9 = v10;
  v11.origin.x = v5;
  v11.origin.y = v6;
  v11.size.width = v7;
  v11.size.height = v8;
  CGRectApplyAffineTransform(v11, &v9);
}

id pfc_shuffle_log()
{
  if (pfc_shuffle_log_onceToken != -1) {
    dispatch_once(&pfc_shuffle_log_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)pfc_shuffle_log___logger;
  return v0;
}

uint64_t __pfc_shuffle_log_block_invoke()
{
  pfc_shuffle_log___logger = (uint64_t)os_log_create("com.apple.photosface", "shuffle");
  return MEMORY[0x270F9A758]();
}

uint64_t sub_25933292C()
{
  return sub_259332D68();
}

uint64_t sub_259332974()
{
  return sub_259332D58();
}

uint64_t sub_2593329A0()
{
  return sub_259332D68();
}

void PFCTimePosition.description.getter()
{
}

unint64_t sub_259332AE8()
{
  unint64_t result = qword_26A387F80;
  if (!qword_26A387F80)
  {
    type metadata accessor for PFCTimePosition();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26A387F80);
  }
  return result;
}

void type metadata accessor for PFCTimePosition()
{
  if (!qword_26A387F88)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_26A387F88);
    }
  }
}

void sub_259332B98()
{
}

BOOL sub_259332BA0(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_259332BB4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_259332BC4(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_259332D38()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_259332D48()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_259332D58()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_259332D68()
{
  return MEMORY[0x270F9FC90]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t PHSuggestionStringWithSubtype()
{
  return MEMORY[0x270EFA310]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}