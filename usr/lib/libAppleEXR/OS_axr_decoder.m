@interface OS_axr_decoder
- (NSString)debugDescription;
- (NSString)description;
- (void)dealloc;
@end

@implementation OS_axr_decoder

- (NSString)debugDescription
{
  uint64_t v2 = MEMORY[0x270FA5388](self, a2);
  uint64_t v6 = v2;
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v11 = 0;
  if (*(_DWORD *)(v2 + 32)) {
    PrintChannel(v15, *(ReadChannel **)(v2 + 24), (ReadChannel *)&v11, (int *)(*(void *)(v2 + 16) + 16), (const AXRData *)*(unsigned int *)(v2 + 40), v3, v4, v5);
  }
  else {
    strcpy(v15, "<no channels defined>");
  }
  int v7 = *(_DWORD *)(v6 + 56);
  if (v7) {
    snprintf(__str, 0x100uLL, "[%u, %u]", *(_DWORD *)(v6 + 48), v7 + *(_DWORD *)(v6 + 48) - 1);
  }
  else {
    strcpy(__str, "<size=0>");
  }
  int v8 = *(_DWORD *)(v6 + 60);
  if (v8) {
    snprintf(v12, 0x100uLL, "[%u, %u]", *(_DWORD *)(v6 + 52), v8 + *(_DWORD *)(v6 + 52) - 1);
  }
  else {
    strcpy(v12, "<size=0>");
  }
  axr_flags_get_name(buf, 0x1000uLL, *(axr_flags_t *)(v6 + 80));
  v10.receiver = (id)v6;
  v10.super_class = (Class)OS_axr_decoder;
  return (NSString *)[NSString stringWithFormat:@"%@\n\tdata:             %p\n\tpart index:       %u\n\tlevel index:      %u\n\tchannel count:    %u\n\tchannels in part: %u\n\tdata window:      x:[%u, %u] y:[%u, %u]\n\tsub region:       x:%s y:%s\n\tflags:            %s\n\tchannels:\n%s", -[OS_axr_decoder debugDescription](&v10, sel_debugDescription), *(void *)(v6 + 16), *(unsigned int *)(v6 + 40), *(unsigned int *)(v6 + 44), *(unsigned int *)(v6 + 32), *(unsigned int *)(v6 + 36), *(unsigned int *)(v6 + 64), *(unsigned int *)(v6 + 68), *(unsigned int *)(v6 + 72), *(unsigned int *)(v6 + 76), __str, v12, buf, v15];
}

- (NSString)description
{
  return (NSString *)@"axr_decoder_t";
}

- (void)dealloc
{
  axr_decoder::~axr_decoder(&self->super.super);
  v3.receiver = v2;
  v3.super_class = (Class)OS_axr_decoder;
  [(OS_axr_decoder *)&v3 dealloc];
}

@end