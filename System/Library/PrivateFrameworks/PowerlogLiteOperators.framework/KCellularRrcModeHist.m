@interface KCellularRrcModeHist
- (BOOL)hasConnDurBin0;
- (BOOL)hasConnDurBin1;
- (BOOL)hasConnDurBin10;
- (BOOL)hasConnDurBin11;
- (BOOL)hasConnDurBin12;
- (BOOL)hasConnDurBin2;
- (BOOL)hasConnDurBin3;
- (BOOL)hasConnDurBin4;
- (BOOL)hasConnDurBin5;
- (BOOL)hasConnDurBin6;
- (BOOL)hasConnDurBin7;
- (BOOL)hasConnDurBin8;
- (BOOL)hasConnDurBin9;
- (BOOL)hasDurationMs;
- (BOOL)hasIdleDurBin0;
- (BOOL)hasIdleDurBin1;
- (BOOL)hasIdleDurBin10;
- (BOOL)hasIdleDurBin11;
- (BOOL)hasIdleDurBin12;
- (BOOL)hasIdleDurBin2;
- (BOOL)hasIdleDurBin3;
- (BOOL)hasIdleDurBin4;
- (BOOL)hasIdleDurBin5;
- (BOOL)hasIdleDurBin6;
- (BOOL)hasIdleDurBin7;
- (BOOL)hasIdleDurBin8;
- (BOOL)hasIdleDurBin9;
- (BOOL)hasSubsId;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)connDurBin0;
- (unsigned)connDurBin1;
- (unsigned)connDurBin10;
- (unsigned)connDurBin11;
- (unsigned)connDurBin12;
- (unsigned)connDurBin2;
- (unsigned)connDurBin3;
- (unsigned)connDurBin4;
- (unsigned)connDurBin5;
- (unsigned)connDurBin6;
- (unsigned)connDurBin7;
- (unsigned)connDurBin8;
- (unsigned)connDurBin9;
- (unsigned)durationMs;
- (unsigned)idleDurBin0;
- (unsigned)idleDurBin1;
- (unsigned)idleDurBin10;
- (unsigned)idleDurBin11;
- (unsigned)idleDurBin12;
- (unsigned)idleDurBin2;
- (unsigned)idleDurBin3;
- (unsigned)idleDurBin4;
- (unsigned)idleDurBin5;
- (unsigned)idleDurBin6;
- (unsigned)idleDurBin7;
- (unsigned)idleDurBin8;
- (unsigned)idleDurBin9;
- (unsigned)subsId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnDurBin0:(unsigned int)a3;
- (void)setConnDurBin10:(unsigned int)a3;
- (void)setConnDurBin11:(unsigned int)a3;
- (void)setConnDurBin12:(unsigned int)a3;
- (void)setConnDurBin1:(unsigned int)a3;
- (void)setConnDurBin2:(unsigned int)a3;
- (void)setConnDurBin3:(unsigned int)a3;
- (void)setConnDurBin4:(unsigned int)a3;
- (void)setConnDurBin5:(unsigned int)a3;
- (void)setConnDurBin6:(unsigned int)a3;
- (void)setConnDurBin7:(unsigned int)a3;
- (void)setConnDurBin8:(unsigned int)a3;
- (void)setConnDurBin9:(unsigned int)a3;
- (void)setDurationMs:(unsigned int)a3;
- (void)setHasConnDurBin0:(BOOL)a3;
- (void)setHasConnDurBin10:(BOOL)a3;
- (void)setHasConnDurBin11:(BOOL)a3;
- (void)setHasConnDurBin12:(BOOL)a3;
- (void)setHasConnDurBin1:(BOOL)a3;
- (void)setHasConnDurBin2:(BOOL)a3;
- (void)setHasConnDurBin3:(BOOL)a3;
- (void)setHasConnDurBin4:(BOOL)a3;
- (void)setHasConnDurBin5:(BOOL)a3;
- (void)setHasConnDurBin6:(BOOL)a3;
- (void)setHasConnDurBin7:(BOOL)a3;
- (void)setHasConnDurBin8:(BOOL)a3;
- (void)setHasConnDurBin9:(BOOL)a3;
- (void)setHasDurationMs:(BOOL)a3;
- (void)setHasIdleDurBin0:(BOOL)a3;
- (void)setHasIdleDurBin10:(BOOL)a3;
- (void)setHasIdleDurBin11:(BOOL)a3;
- (void)setHasIdleDurBin12:(BOOL)a3;
- (void)setHasIdleDurBin1:(BOOL)a3;
- (void)setHasIdleDurBin2:(BOOL)a3;
- (void)setHasIdleDurBin3:(BOOL)a3;
- (void)setHasIdleDurBin4:(BOOL)a3;
- (void)setHasIdleDurBin5:(BOOL)a3;
- (void)setHasIdleDurBin6:(BOOL)a3;
- (void)setHasIdleDurBin7:(BOOL)a3;
- (void)setHasIdleDurBin8:(BOOL)a3;
- (void)setHasIdleDurBin9:(BOOL)a3;
- (void)setHasSubsId:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIdleDurBin0:(unsigned int)a3;
- (void)setIdleDurBin10:(unsigned int)a3;
- (void)setIdleDurBin11:(unsigned int)a3;
- (void)setIdleDurBin12:(unsigned int)a3;
- (void)setIdleDurBin1:(unsigned int)a3;
- (void)setIdleDurBin2:(unsigned int)a3;
- (void)setIdleDurBin3:(unsigned int)a3;
- (void)setIdleDurBin4:(unsigned int)a3;
- (void)setIdleDurBin5:(unsigned int)a3;
- (void)setIdleDurBin6:(unsigned int)a3;
- (void)setIdleDurBin7:(unsigned int)a3;
- (void)setIdleDurBin8:(unsigned int)a3;
- (void)setIdleDurBin9:(unsigned int)a3;
- (void)setSubsId:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation KCellularRrcModeHist

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setDurationMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_durationMs = a3;
}

- (void)setHasDurationMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasDurationMs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIdleDurBin0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_idleDurBin0 = a3;
}

- (void)setHasIdleDurBin0:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIdleDurBin0
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIdleDurBin1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_idleDurBin1 = a3;
}

- (void)setHasIdleDurBin1:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIdleDurBin1
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIdleDurBin2:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_idleDurBin2 = a3;
}

- (void)setHasIdleDurBin2:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIdleDurBin2
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIdleDurBin3:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_idleDurBin3 = a3;
}

- (void)setHasIdleDurBin3:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIdleDurBin3
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setIdleDurBin4:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_idleDurBin4 = a3;
}

- (void)setHasIdleDurBin4:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIdleDurBin4
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIdleDurBin5:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_idleDurBin5 = a3;
}

- (void)setHasIdleDurBin5:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIdleDurBin5
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setIdleDurBin6:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_idleDurBin6 = a3;
}

- (void)setHasIdleDurBin6:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIdleDurBin6
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setIdleDurBin7:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_idleDurBin7 = a3;
}

- (void)setHasIdleDurBin7:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIdleDurBin7
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIdleDurBin8:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_idleDurBin8 = a3;
}

- (void)setHasIdleDurBin8:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIdleDurBin8
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIdleDurBin9:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_idleDurBin9 = a3;
}

- (void)setHasIdleDurBin9:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIdleDurBin9
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setIdleDurBin10:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_idleDurBin10 = a3;
}

- (void)setHasIdleDurBin10:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIdleDurBin10
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setIdleDurBin11:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_idleDurBin11 = a3;
}

- (void)setHasIdleDurBin11:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIdleDurBin11
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setIdleDurBin12:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_idleDurBin12 = a3;
}

- (void)setHasIdleDurBin12:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIdleDurBin12
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setConnDurBin0:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_connDurBin0 = a3;
}

- (void)setHasConnDurBin0:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasConnDurBin0
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConnDurBin1:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_connDurBin1 = a3;
}

- (void)setHasConnDurBin1:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasConnDurBin1
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setConnDurBin2:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_connDurBin2 = a3;
}

- (void)setHasConnDurBin2:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasConnDurBin2
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setConnDurBin3:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_connDurBin3 = a3;
}

- (void)setHasConnDurBin3:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasConnDurBin3
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setConnDurBin4:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_connDurBin4 = a3;
}

- (void)setHasConnDurBin4:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasConnDurBin4
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setConnDurBin5:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_connDurBin5 = a3;
}

- (void)setHasConnDurBin5:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasConnDurBin5
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setConnDurBin6:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_connDurBin6 = a3;
}

- (void)setHasConnDurBin6:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasConnDurBin6
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setConnDurBin7:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_connDurBin7 = a3;
}

- (void)setHasConnDurBin7:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasConnDurBin7
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setConnDurBin8:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_connDurBin8 = a3;
}

- (void)setHasConnDurBin8:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasConnDurBin8
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setConnDurBin9:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_connDurBin9 = a3;
}

- (void)setHasConnDurBin9:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasConnDurBin9
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setConnDurBin10:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_connDurBin10 = a3;
}

- (void)setHasConnDurBin10:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasConnDurBin10
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setConnDurBin11:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_connDurBin11 = a3;
}

- (void)setHasConnDurBin11:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasConnDurBin11
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setConnDurBin12:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_connDurBin12 = a3;
}

- (void)setHasConnDurBin12:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasConnDurBin12
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSubsId:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_subsId = a3;
}

- (void)setHasSubsId:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($822B6F46BB0A52EB0243F2BF462E3966)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasSubsId
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)KCellularRrcModeHist;
  v4 = [(KCellularRrcModeHist *)&v8 description];
  v5 = [(KCellularRrcModeHist *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v7 forKey:@"timestamp"];

    $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithUnsignedInt:self->_durationMs];
  [v3 setObject:v8 forKey:@"duration_ms"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  v9 = [NSNumber numberWithUnsignedInt:self->_idleDurBin0];
  [v3 setObject:v9 forKey:@"idle_dur_bin_0"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  v10 = [NSNumber numberWithUnsignedInt:self->_idleDurBin1];
  [v3 setObject:v10 forKey:@"idle_dur_bin_1"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  v11 = [NSNumber numberWithUnsignedInt:self->_idleDurBin2];
  [v3 setObject:v11 forKey:@"idle_dur_bin_2"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  v12 = [NSNumber numberWithUnsignedInt:self->_idleDurBin3];
  [v3 setObject:v12 forKey:@"idle_dur_bin_3"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  v13 = [NSNumber numberWithUnsignedInt:self->_idleDurBin4];
  [v3 setObject:v13 forKey:@"idle_dur_bin_4"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  v14 = [NSNumber numberWithUnsignedInt:self->_idleDurBin5];
  [v3 setObject:v14 forKey:@"idle_dur_bin_5"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  v15 = [NSNumber numberWithUnsignedInt:self->_idleDurBin6];
  [v3 setObject:v15 forKey:@"idle_dur_bin_6"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  v16 = [NSNumber numberWithUnsignedInt:self->_idleDurBin7];
  [v3 setObject:v16 forKey:@"idle_dur_bin_7"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  v17 = [NSNumber numberWithUnsignedInt:self->_idleDurBin8];
  [v3 setObject:v17 forKey:@"idle_dur_bin_8"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  v18 = [NSNumber numberWithUnsignedInt:self->_idleDurBin9];
  [v3 setObject:v18 forKey:@"idle_dur_bin_9"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  v19 = [NSNumber numberWithUnsignedInt:self->_idleDurBin10];
  [v3 setObject:v19 forKey:@"idle_dur_bin_10"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  v20 = [NSNumber numberWithUnsignedInt:self->_idleDurBin11];
  [v3 setObject:v20 forKey:@"idle_dur_bin_11"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  v21 = [NSNumber numberWithUnsignedInt:self->_idleDurBin12];
  [v3 setObject:v21 forKey:@"idle_dur_bin_12"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  v22 = [NSNumber numberWithUnsignedInt:self->_connDurBin0];
  [v3 setObject:v22 forKey:@"conn_dur_bin_0"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  v23 = [NSNumber numberWithUnsignedInt:self->_connDurBin1];
  [v3 setObject:v23 forKey:@"conn_dur_bin_1"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  v24 = [NSNumber numberWithUnsignedInt:self->_connDurBin2];
  [v3 setObject:v24 forKey:@"conn_dur_bin_2"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  v25 = [NSNumber numberWithUnsignedInt:self->_connDurBin3];
  [v3 setObject:v25 forKey:@"conn_dur_bin_3"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  v26 = [NSNumber numberWithUnsignedInt:self->_connDurBin4];
  [v3 setObject:v26 forKey:@"conn_dur_bin_4"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  v27 = [NSNumber numberWithUnsignedInt:self->_connDurBin5];
  [v3 setObject:v27 forKey:@"conn_dur_bin_5"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  v28 = [NSNumber numberWithUnsignedInt:self->_connDurBin6];
  [v3 setObject:v28 forKey:@"conn_dur_bin_6"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  v29 = [NSNumber numberWithUnsignedInt:self->_connDurBin7];
  [v3 setObject:v29 forKey:@"conn_dur_bin_7"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  v30 = [NSNumber numberWithUnsignedInt:self->_connDurBin8];
  [v3 setObject:v30 forKey:@"conn_dur_bin_8"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  v31 = [NSNumber numberWithUnsignedInt:self->_connDurBin9];
  [v3 setObject:v31 forKey:@"conn_dur_bin_9"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  v32 = [NSNumber numberWithUnsignedInt:self->_connDurBin10];
  [v3 setObject:v32 forKey:@"conn_dur_bin_10"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  v33 = [NSNumber numberWithUnsignedInt:self->_connDurBin11];
  [v3 setObject:v33 forKey:@"conn_dur_bin_11"];

  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_61:
  v34 = [NSNumber numberWithUnsignedInt:self->_connDurBin12];
  [v3 setObject:v34 forKey:@"conn_dur_bin_12"];

  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_30:
    v5 = [NSNumber numberWithUnsignedInt:self->_subsId];
    [v3 setObject:v5 forKey:@"subs_id"];
  }
LABEL_31:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return KCellularRrcModeHistReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0) {
LABEL_30:
  }
    PBDataWriterWriteUint32Field();
LABEL_31:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if (*(unsigned char *)&has)
  {
    v4[1] = self->_timestamp;
    *((_DWORD *)v4 + 32) |= 1u;
    $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 17) = self->_durationMs;
  *((_DWORD *)v4 + 32) |= 0x4000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)v4 + 18) = self->_idleDurBin0;
  *((_DWORD *)v4 + 32) |= 0x8000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 19) = self->_idleDurBin1;
  *((_DWORD *)v4 + 32) |= 0x10000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)v4 + 23) = self->_idleDurBin2;
  *((_DWORD *)v4 + 32) |= 0x100000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)v4 + 24) = self->_idleDurBin3;
  *((_DWORD *)v4 + 32) |= 0x200000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)v4 + 25) = self->_idleDurBin4;
  *((_DWORD *)v4 + 32) |= 0x400000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)v4 + 26) = self->_idleDurBin5;
  *((_DWORD *)v4 + 32) |= 0x800000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)v4 + 27) = self->_idleDurBin6;
  *((_DWORD *)v4 + 32) |= 0x1000000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)v4 + 28) = self->_idleDurBin7;
  *((_DWORD *)v4 + 32) |= 0x2000000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)v4 + 29) = self->_idleDurBin8;
  *((_DWORD *)v4 + 32) |= 0x4000000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)v4 + 30) = self->_idleDurBin9;
  *((_DWORD *)v4 + 32) |= 0x8000000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)v4 + 20) = self->_idleDurBin10;
  *((_DWORD *)v4 + 32) |= 0x20000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)v4 + 21) = self->_idleDurBin11;
  *((_DWORD *)v4 + 32) |= 0x40000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)v4 + 22) = self->_idleDurBin12;
  *((_DWORD *)v4 + 32) |= 0x80000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 4) = self->_connDurBin0;
  *((_DWORD *)v4 + 32) |= 2u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 5) = self->_connDurBin1;
  *((_DWORD *)v4 + 32) |= 4u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 9) = self->_connDurBin2;
  *((_DWORD *)v4 + 32) |= 0x40u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)v4 + 10) = self->_connDurBin3;
  *((_DWORD *)v4 + 32) |= 0x80u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)v4 + 11) = self->_connDurBin4;
  *((_DWORD *)v4 + 32) |= 0x100u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)v4 + 12) = self->_connDurBin5;
  *((_DWORD *)v4 + 32) |= 0x200u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)v4 + 13) = self->_connDurBin6;
  *((_DWORD *)v4 + 32) |= 0x400u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)v4 + 14) = self->_connDurBin7;
  *((_DWORD *)v4 + 32) |= 0x800u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)v4 + 15) = self->_connDurBin8;
  *((_DWORD *)v4 + 32) |= 0x1000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)v4 + 16) = self->_connDurBin9;
  *((_DWORD *)v4 + 32) |= 0x2000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)v4 + 6) = self->_connDurBin10;
  *((_DWORD *)v4 + 32) |= 8u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)v4 + 7) = self->_connDurBin11;
  *((_DWORD *)v4 + 32) |= 0x10u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_61:
  *((_DWORD *)v4 + 8) = self->_connDurBin12;
  *((_DWORD *)v4 + 32) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_30:
    *((_DWORD *)v4 + 31) = self->_subsId;
    *((_DWORD *)v4 + 32) |= 0x10000000u;
  }
LABEL_31:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((_DWORD *)result + 32) |= 1u;
    $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 17) = self->_durationMs;
  *((_DWORD *)result + 32) |= 0x4000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)result + 18) = self->_idleDurBin0;
  *((_DWORD *)result + 32) |= 0x8000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)result + 19) = self->_idleDurBin1;
  *((_DWORD *)result + 32) |= 0x10000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)result + 23) = self->_idleDurBin2;
  *((_DWORD *)result + 32) |= 0x100000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 24) = self->_idleDurBin3;
  *((_DWORD *)result + 32) |= 0x200000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 25) = self->_idleDurBin4;
  *((_DWORD *)result + 32) |= 0x400000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 26) = self->_idleDurBin5;
  *((_DWORD *)result + 32) |= 0x800000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 27) = self->_idleDurBin6;
  *((_DWORD *)result + 32) |= 0x1000000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 28) = self->_idleDurBin7;
  *((_DWORD *)result + 32) |= 0x2000000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 29) = self->_idleDurBin8;
  *((_DWORD *)result + 32) |= 0x4000000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 30) = self->_idleDurBin9;
  *((_DWORD *)result + 32) |= 0x8000000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)result + 20) = self->_idleDurBin10;
  *((_DWORD *)result + 32) |= 0x20000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)result + 21) = self->_idleDurBin11;
  *((_DWORD *)result + 32) |= 0x40000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)result + 22) = self->_idleDurBin12;
  *((_DWORD *)result + 32) |= 0x80000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)result + 4) = self->_connDurBin0;
  *((_DWORD *)result + 32) |= 2u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)result + 5) = self->_connDurBin1;
  *((_DWORD *)result + 32) |= 4u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)result + 9) = self->_connDurBin2;
  *((_DWORD *)result + 32) |= 0x40u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)result + 10) = self->_connDurBin3;
  *((_DWORD *)result + 32) |= 0x80u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)result + 11) = self->_connDurBin4;
  *((_DWORD *)result + 32) |= 0x100u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)result + 12) = self->_connDurBin5;
  *((_DWORD *)result + 32) |= 0x200u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)result + 13) = self->_connDurBin6;
  *((_DWORD *)result + 32) |= 0x400u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)result + 14) = self->_connDurBin7;
  *((_DWORD *)result + 32) |= 0x800u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)result + 15) = self->_connDurBin8;
  *((_DWORD *)result + 32) |= 0x1000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)result + 16) = self->_connDurBin9;
  *((_DWORD *)result + 32) |= 0x2000u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)result + 6) = self->_connDurBin10;
  *((_DWORD *)result + 32) |= 8u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)result + 7) = self->_connDurBin11;
  *((_DWORD *)result + 32) |= 0x10u;
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      return result;
    }
    goto LABEL_30;
  }
LABEL_59:
  *((_DWORD *)result + 8) = self->_connDurBin12;
  *((_DWORD *)result + 32) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
    return result;
  }
LABEL_30:
  *((_DWORD *)result + 31) = self->_subsId;
  *((_DWORD *)result + 32) |= 0x10000000u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_147;
  }
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  int v6 = *((_DWORD *)v4 + 32);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_147;
    }
  }
  else if (v6)
  {
LABEL_147:
    BOOL v7 = 0;
    goto LABEL_148;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0 || self->_durationMs != *((_DWORD *)v4 + 17)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v6 & 0x8000) == 0 || self->_idleDurBin0 != *((_DWORD *)v4 + 18)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x8000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0 || self->_idleDurBin1 != *((_DWORD *)v4 + 19)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_idleDurBin2 != *((_DWORD *)v4 + 23)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0 || self->_idleDurBin3 != *((_DWORD *)v4 + 24)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0 || self->_idleDurBin4 != *((_DWORD *)v4 + 25)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0 || self->_idleDurBin5 != *((_DWORD *)v4 + 26)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0 || self->_idleDurBin6 != *((_DWORD *)v4 + 27)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0 || self->_idleDurBin7 != *((_DWORD *)v4 + 28)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v6 & 0x4000000) == 0 || self->_idleDurBin8 != *((_DWORD *)v4 + 29)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x4000000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v6 & 0x8000000) == 0 || self->_idleDurBin9 != *((_DWORD *)v4 + 30)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x8000000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0 || self->_idleDurBin10 != *((_DWORD *)v4 + 20)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0 || self->_idleDurBin11 != *((_DWORD *)v4 + 21)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0 || self->_idleDurBin12 != *((_DWORD *)v4 + 22)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_connDurBin0 != *((_DWORD *)v4 + 4)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_147;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_connDurBin1 != *((_DWORD *)v4 + 5)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_147;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_connDurBin2 != *((_DWORD *)v4 + 9)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_147;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_connDurBin3 != *((_DWORD *)v4 + 10)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_connDurBin4 != *((_DWORD *)v4 + 11)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_connDurBin5 != *((_DWORD *)v4 + 12)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0 || self->_connDurBin6 != *((_DWORD *)v4 + 13)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0 || self->_connDurBin7 != *((_DWORD *)v4 + 14)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_connDurBin8 != *((_DWORD *)v4 + 15)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0 || self->_connDurBin9 != *((_DWORD *)v4 + 16)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_147;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_connDurBin10 != *((_DWORD *)v4 + 6)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_147;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_connDurBin11 != *((_DWORD *)v4 + 7)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_147;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_connDurBin12 != *((_DWORD *)v4 + 8)) {
      goto LABEL_147;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_147;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_subsId != *((_DWORD *)v4 + 31)) {
      goto LABEL_147;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 0x10000000) == 0;
  }
LABEL_148:

  return v7;
}

- (unint64_t)hash
{
  $822B6F46BB0A52EB0243F2BF462E3966 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v32 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
LABEL_3:
      uint64_t v31 = 2654435761 * self->_durationMs;
      if ((*(_WORD *)&has & 0x8000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_33;
    }
  }
  else
  {
    unint64_t v32 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v31 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    uint64_t v3 = 2654435761 * self->_idleDurBin0;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v3 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_idleDurBin1;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v4 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_idleDurBin2;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_7:
    uint64_t v6 = 2654435761 * self->_idleDurBin3;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_8:
    uint64_t v7 = 2654435761 * self->_idleDurBin4;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_idleDurBin5;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_10:
    uint64_t v9 = 2654435761 * self->_idleDurBin6;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v9 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_11:
    uint64_t v10 = 2654435761 * self->_idleDurBin7;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v10 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_12:
    uint64_t v11 = 2654435761 * self->_idleDurBin8;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v11 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_13:
    uint64_t v12 = 2654435761 * self->_idleDurBin9;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_14:
    uint64_t v13 = 2654435761 * self->_idleDurBin10;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v13 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_15:
    uint64_t v14 = 2654435761 * self->_idleDurBin11;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v14 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_16:
    uint64_t v15 = 2654435761 * self->_idleDurBin12;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v15 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_17:
    uint64_t v16 = 2654435761 * self->_connDurBin0;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_18:
    uint64_t v17 = 2654435761 * self->_connDurBin1;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_19:
    uint64_t v18 = 2654435761 * self->_connDurBin2;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_20:
    uint64_t v19 = 2654435761 * self->_connDurBin3;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v19 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_21:
    uint64_t v20 = 2654435761 * self->_connDurBin4;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v20 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_22:
    uint64_t v21 = 2654435761 * self->_connDurBin5;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v21 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_23:
    uint64_t v22 = 2654435761 * self->_connDurBin6;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_24;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v22 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_24:
    uint64_t v23 = 2654435761 * self->_connDurBin7;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_25:
    uint64_t v24 = 2654435761 * self->_connDurBin8;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_26:
    uint64_t v25 = 2654435761 * self->_connDurBin9;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v25 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_27:
    uint64_t v26 = 2654435761 * self->_connDurBin10;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v26 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_28:
    uint64_t v27 = 2654435761 * self->_connDurBin11;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_29;
    }
LABEL_58:
    uint64_t v28 = 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_30;
    }
LABEL_59:
    uint64_t v29 = 0;
    return v31 ^ v32 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_57:
  uint64_t v27 = 0;
  if ((*(unsigned char *)&has & 0x20) == 0) {
    goto LABEL_58;
  }
LABEL_29:
  uint64_t v28 = 2654435761 * self->_connDurBin12;
  if ((*(_DWORD *)&has & 0x10000000) == 0) {
    goto LABEL_59;
  }
LABEL_30:
  uint64_t v29 = 2654435761 * self->_subsId;
  return v31 ^ v32 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  int v5 = *((_DWORD *)v4 + 32);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)v4 + 32);
    if ((v5 & 0x4000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((v5 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_durationMs = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_idleDurBin0 = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x10000) == 0)
  {
LABEL_5:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_idleDurBin1 = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x100000) == 0)
  {
LABEL_6:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_idleDurBin2 = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x200000) == 0)
  {
LABEL_7:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_idleDurBin3 = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x400000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_idleDurBin4 = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_idleDurBin5 = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_idleDurBin6 = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_idleDurBin7 = *((_DWORD *)v4 + 28);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_idleDurBin8 = *((_DWORD *)v4 + 29);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_idleDurBin9 = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x20000) == 0)
  {
LABEL_14:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_idleDurBin10 = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x40000) == 0)
  {
LABEL_15:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_idleDurBin11 = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x80000) == 0)
  {
LABEL_16:
    if ((v5 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_idleDurBin12 = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 2) == 0)
  {
LABEL_17:
    if ((v5 & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_connDurBin0 = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 4) == 0)
  {
LABEL_18:
    if ((v5 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_connDurBin1 = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x40) == 0)
  {
LABEL_19:
    if ((v5 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_connDurBin2 = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x80) == 0)
  {
LABEL_20:
    if ((v5 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_connDurBin3 = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x100) == 0)
  {
LABEL_21:
    if ((v5 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_connDurBin4 = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x200) == 0)
  {
LABEL_22:
    if ((v5 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_connDurBin5 = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x400) == 0)
  {
LABEL_23:
    if ((v5 & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_connDurBin6 = *((_DWORD *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x800) == 0)
  {
LABEL_24:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_connDurBin7 = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x1000) == 0)
  {
LABEL_25:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_connDurBin8 = *((_DWORD *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x2000) == 0)
  {
LABEL_26:
    if ((v5 & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_connDurBin9 = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 8) == 0)
  {
LABEL_27:
    if ((v5 & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_connDurBin10 = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x10) == 0)
  {
LABEL_28:
    if ((v5 & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_connDurBin11 = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)v4 + 32);
  if ((v5 & 0x20) == 0)
  {
LABEL_29:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_61:
  self->_connDurBin12 = *((_DWORD *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 32) & 0x10000000) != 0)
  {
LABEL_30:
    self->_subsId = *((_DWORD *)v4 + 31);
    *(_DWORD *)&self->_has |= 0x10000000u;
  }
LABEL_31:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)durationMs
{
  return self->_durationMs;
}

- (unsigned)idleDurBin0
{
  return self->_idleDurBin0;
}

- (unsigned)idleDurBin1
{
  return self->_idleDurBin1;
}

- (unsigned)idleDurBin2
{
  return self->_idleDurBin2;
}

- (unsigned)idleDurBin3
{
  return self->_idleDurBin3;
}

- (unsigned)idleDurBin4
{
  return self->_idleDurBin4;
}

- (unsigned)idleDurBin5
{
  return self->_idleDurBin5;
}

- (unsigned)idleDurBin6
{
  return self->_idleDurBin6;
}

- (unsigned)idleDurBin7
{
  return self->_idleDurBin7;
}

- (unsigned)idleDurBin8
{
  return self->_idleDurBin8;
}

- (unsigned)idleDurBin9
{
  return self->_idleDurBin9;
}

- (unsigned)idleDurBin10
{
  return self->_idleDurBin10;
}

- (unsigned)idleDurBin11
{
  return self->_idleDurBin11;
}

- (unsigned)idleDurBin12
{
  return self->_idleDurBin12;
}

- (unsigned)connDurBin0
{
  return self->_connDurBin0;
}

- (unsigned)connDurBin1
{
  return self->_connDurBin1;
}

- (unsigned)connDurBin2
{
  return self->_connDurBin2;
}

- (unsigned)connDurBin3
{
  return self->_connDurBin3;
}

- (unsigned)connDurBin4
{
  return self->_connDurBin4;
}

- (unsigned)connDurBin5
{
  return self->_connDurBin5;
}

- (unsigned)connDurBin6
{
  return self->_connDurBin6;
}

- (unsigned)connDurBin7
{
  return self->_connDurBin7;
}

- (unsigned)connDurBin8
{
  return self->_connDurBin8;
}

- (unsigned)connDurBin9
{
  return self->_connDurBin9;
}

- (unsigned)connDurBin10
{
  return self->_connDurBin10;
}

- (unsigned)connDurBin11
{
  return self->_connDurBin11;
}

- (unsigned)connDurBin12
{
  return self->_connDurBin12;
}

- (unsigned)subsId
{
  return self->_subsId;
}

@end