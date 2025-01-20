@interface AWDNWAPIUsage
- (BOOL)hasIfFltrAttach;
- (BOOL)hasIfFltrAttachOs;
- (BOOL)hasIfNetagentEnabled;
- (BOOL)hasIfnetAlloc;
- (BOOL)hasIfnetAllocOs;
- (BOOL)hasIpFltrAdd;
- (BOOL)hasIpFltrAddOs;
- (BOOL)hasNexusFlowInet6Datagram;
- (BOOL)hasNexusFlowInet6Stream;
- (BOOL)hasNexusFlowInetDatagram;
- (BOOL)hasNexusFlowInetStream;
- (BOOL)hasPfAddrule;
- (BOOL)hasPfAddruleOs;
- (BOOL)hasSockAlloc;
- (BOOL)hasSockAllocKernel;
- (BOOL)hasSockAllocKernelOs;
- (BOOL)hasSockDomainInet;
- (BOOL)hasSockDomainInet6;
- (BOOL)hasSockDomainKey;
- (BOOL)hasSockDomainLocal;
- (BOOL)hasSockDomainMultipath;
- (BOOL)hasSockDomainNdrv;
- (BOOL)hasSockDomainOther;
- (BOOL)hasSockDomainRoute;
- (BOOL)hasSockDomainSystem;
- (BOOL)hasSockFltrRegister;
- (BOOL)hasSockFltrRegisterOs;
- (BOOL)hasSockInetMcastJoin;
- (BOOL)hasSockInetMcastJoinOs;
- (BOOL)hasSockNecpClientuuidCount;
- (BOOL)hasSockNetInet6Dgram;
- (BOOL)hasSockNetInet6DgramConnected;
- (BOOL)hasSockNetInet6DgramDns;
- (BOOL)hasSockNetInet6DgramNoData;
- (BOOL)hasSockNetInet6Stream;
- (BOOL)hasSockNetInetDgram;
- (BOOL)hasSockNetInetDgramConnected;
- (BOOL)hasSockNetInetDgramDns;
- (BOOL)hasSockNetInetDgramNoData;
- (BOOL)hasSockNetInetStream;
- (BOOL)hasTimeSinceLastReport;
- (BOOL)hasTimestamp;
- (BOOL)hasVmnetStart;
- (BOOL)ifNetagentEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)ifFltrAttach;
- (int64_t)ifFltrAttachOs;
- (int64_t)ifnetAlloc;
- (int64_t)ifnetAllocOs;
- (int64_t)ipFltrAdd;
- (int64_t)ipFltrAddOs;
- (int64_t)nexusFlowInet6Datagram;
- (int64_t)nexusFlowInet6Stream;
- (int64_t)nexusFlowInetDatagram;
- (int64_t)nexusFlowInetStream;
- (int64_t)pfAddrule;
- (int64_t)pfAddruleOs;
- (int64_t)sockAlloc;
- (int64_t)sockAllocKernel;
- (int64_t)sockAllocKernelOs;
- (int64_t)sockDomainInet;
- (int64_t)sockDomainInet6;
- (int64_t)sockDomainKey;
- (int64_t)sockDomainLocal;
- (int64_t)sockDomainMultipath;
- (int64_t)sockDomainNdrv;
- (int64_t)sockDomainOther;
- (int64_t)sockDomainRoute;
- (int64_t)sockDomainSystem;
- (int64_t)sockFltrRegister;
- (int64_t)sockFltrRegisterOs;
- (int64_t)sockInetMcastJoin;
- (int64_t)sockInetMcastJoinOs;
- (int64_t)sockNecpClientuuidCount;
- (int64_t)sockNetInet6Dgram;
- (int64_t)sockNetInet6DgramConnected;
- (int64_t)sockNetInet6DgramDns;
- (int64_t)sockNetInet6DgramNoData;
- (int64_t)sockNetInet6Stream;
- (int64_t)sockNetInetDgram;
- (int64_t)sockNetInetDgramConnected;
- (int64_t)sockNetInetDgramDns;
- (int64_t)sockNetInetDgramNoData;
- (int64_t)sockNetInetStream;
- (int64_t)vmnetStart;
- (unint64_t)hash;
- (unint64_t)timeSinceLastReport;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIfFltrAttach:(BOOL)a3;
- (void)setHasIfFltrAttachOs:(BOOL)a3;
- (void)setHasIfNetagentEnabled:(BOOL)a3;
- (void)setHasIfnetAlloc:(BOOL)a3;
- (void)setHasIfnetAllocOs:(BOOL)a3;
- (void)setHasIpFltrAdd:(BOOL)a3;
- (void)setHasIpFltrAddOs:(BOOL)a3;
- (void)setHasNexusFlowInet6Datagram:(BOOL)a3;
- (void)setHasNexusFlowInet6Stream:(BOOL)a3;
- (void)setHasNexusFlowInetDatagram:(BOOL)a3;
- (void)setHasNexusFlowInetStream:(BOOL)a3;
- (void)setHasPfAddrule:(BOOL)a3;
- (void)setHasPfAddruleOs:(BOOL)a3;
- (void)setHasSockAlloc:(BOOL)a3;
- (void)setHasSockAllocKernel:(BOOL)a3;
- (void)setHasSockAllocKernelOs:(BOOL)a3;
- (void)setHasSockDomainInet6:(BOOL)a3;
- (void)setHasSockDomainInet:(BOOL)a3;
- (void)setHasSockDomainKey:(BOOL)a3;
- (void)setHasSockDomainLocal:(BOOL)a3;
- (void)setHasSockDomainMultipath:(BOOL)a3;
- (void)setHasSockDomainNdrv:(BOOL)a3;
- (void)setHasSockDomainOther:(BOOL)a3;
- (void)setHasSockDomainRoute:(BOOL)a3;
- (void)setHasSockDomainSystem:(BOOL)a3;
- (void)setHasSockFltrRegister:(BOOL)a3;
- (void)setHasSockFltrRegisterOs:(BOOL)a3;
- (void)setHasSockInetMcastJoin:(BOOL)a3;
- (void)setHasSockInetMcastJoinOs:(BOOL)a3;
- (void)setHasSockNecpClientuuidCount:(BOOL)a3;
- (void)setHasSockNetInet6Dgram:(BOOL)a3;
- (void)setHasSockNetInet6DgramConnected:(BOOL)a3;
- (void)setHasSockNetInet6DgramDns:(BOOL)a3;
- (void)setHasSockNetInet6DgramNoData:(BOOL)a3;
- (void)setHasSockNetInet6Stream:(BOOL)a3;
- (void)setHasSockNetInetDgram:(BOOL)a3;
- (void)setHasSockNetInetDgramConnected:(BOOL)a3;
- (void)setHasSockNetInetDgramDns:(BOOL)a3;
- (void)setHasSockNetInetDgramNoData:(BOOL)a3;
- (void)setHasSockNetInetStream:(BOOL)a3;
- (void)setHasTimeSinceLastReport:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVmnetStart:(BOOL)a3;
- (void)setIfFltrAttach:(int64_t)a3;
- (void)setIfFltrAttachOs:(int64_t)a3;
- (void)setIfNetagentEnabled:(BOOL)a3;
- (void)setIfnetAlloc:(int64_t)a3;
- (void)setIfnetAllocOs:(int64_t)a3;
- (void)setIpFltrAdd:(int64_t)a3;
- (void)setIpFltrAddOs:(int64_t)a3;
- (void)setNexusFlowInet6Datagram:(int64_t)a3;
- (void)setNexusFlowInet6Stream:(int64_t)a3;
- (void)setNexusFlowInetDatagram:(int64_t)a3;
- (void)setNexusFlowInetStream:(int64_t)a3;
- (void)setPfAddrule:(int64_t)a3;
- (void)setPfAddruleOs:(int64_t)a3;
- (void)setSockAlloc:(int64_t)a3;
- (void)setSockAllocKernel:(int64_t)a3;
- (void)setSockAllocKernelOs:(int64_t)a3;
- (void)setSockDomainInet6:(int64_t)a3;
- (void)setSockDomainInet:(int64_t)a3;
- (void)setSockDomainKey:(int64_t)a3;
- (void)setSockDomainLocal:(int64_t)a3;
- (void)setSockDomainMultipath:(int64_t)a3;
- (void)setSockDomainNdrv:(int64_t)a3;
- (void)setSockDomainOther:(int64_t)a3;
- (void)setSockDomainRoute:(int64_t)a3;
- (void)setSockDomainSystem:(int64_t)a3;
- (void)setSockFltrRegister:(int64_t)a3;
- (void)setSockFltrRegisterOs:(int64_t)a3;
- (void)setSockInetMcastJoin:(int64_t)a3;
- (void)setSockInetMcastJoinOs:(int64_t)a3;
- (void)setSockNecpClientuuidCount:(int64_t)a3;
- (void)setSockNetInet6Dgram:(int64_t)a3;
- (void)setSockNetInet6DgramConnected:(int64_t)a3;
- (void)setSockNetInet6DgramDns:(int64_t)a3;
- (void)setSockNetInet6DgramNoData:(int64_t)a3;
- (void)setSockNetInet6Stream:(int64_t)a3;
- (void)setSockNetInetDgram:(int64_t)a3;
- (void)setSockNetInetDgramConnected:(int64_t)a3;
- (void)setSockNetInetDgramDns:(int64_t)a3;
- (void)setSockNetInetDgramNoData:(int64_t)a3;
- (void)setSockNetInetStream:(int64_t)a3;
- (void)setTimeSinceLastReport:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVmnetStart:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDNWAPIUsage

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasTimestamp
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setIfFltrAttach:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_ifFltrAttach = a3;
}

- (void)setHasIfFltrAttach:(BOOL)a3
{
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasIfFltrAttach
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setIfFltrAttachOs:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_ifFltrAttachOs = a3;
}

- (void)setHasIfFltrAttachOs:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasIfFltrAttachOs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIpFltrAdd:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_ipFltrAdd = a3;
}

- (void)setHasIpFltrAdd:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasIpFltrAdd
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIpFltrAddOs:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_ipFltrAddOs = a3;
}

- (void)setHasIpFltrAddOs:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasIpFltrAddOs
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setSockFltrRegister:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_sockFltrRegister = a3;
}

- (void)setHasSockFltrRegister:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasSockFltrRegister
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setSockFltrRegisterOs:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_sockFltrRegisterOs = a3;
}

- (void)setHasSockFltrRegisterOs:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasSockFltrRegisterOs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setSockAlloc:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_sockAlloc = a3;
}

- (void)setHasSockAlloc:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasSockAlloc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setSockAllocKernel:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_sockAllocKernel = a3;
}

- (void)setHasSockAllocKernel:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasSockAllocKernel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setSockAllocKernelOs:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_sockAllocKernelOs = a3;
}

- (void)setHasSockAllocKernelOs:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasSockAllocKernelOs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSockNecpClientuuidCount:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_sockNecpClientuuidCount = a3;
}

- (void)setHasSockNecpClientuuidCount:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasSockNecpClientuuidCount
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setSockDomainLocal:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_sockDomainLocal = a3;
}

- (void)setHasSockDomainLocal:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasSockDomainLocal
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSockDomainRoute:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_sockDomainRoute = a3;
}

- (void)setHasSockDomainRoute:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasSockDomainRoute
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setSockDomainInet:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_sockDomainInet = a3;
}

- (void)setHasSockDomainInet:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasSockDomainInet
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSockDomainInet6:(int64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_sockDomainInet6 = a3;
}

- (void)setHasSockDomainInet6:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasSockDomainInet6
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setSockDomainSystem:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_sockDomainSystem = a3;
}

- (void)setHasSockDomainSystem:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasSockDomainSystem
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setSockDomainMultipath:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_sockDomainMultipath = a3;
}

- (void)setHasSockDomainMultipath:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasSockDomainMultipath
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSockDomainKey:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_sockDomainKey = a3;
}

- (void)setHasSockDomainKey:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasSockDomainKey
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setSockDomainNdrv:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_sockDomainNdrv = a3;
}

- (void)setHasSockDomainNdrv:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasSockDomainNdrv
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setSockDomainOther:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_sockDomainOther = a3;
}

- (void)setHasSockDomainOther:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasSockDomainOther
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setSockNetInetStream:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_sockNetInetStream = a3;
}

- (void)setHasSockNetInetStream:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInetStream
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setSockNetInetDgram:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_sockNetInetDgram = a3;
}

- (void)setHasSockNetInetDgram:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInetDgram
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setSockNetInetDgramConnected:(int64_t)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_sockNetInetDgramConnected = a3;
}

- (void)setHasSockNetInetDgramConnected:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInetDgramConnected
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setSockNetInetDgramDns:(int64_t)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_sockNetInetDgramDns = a3;
}

- (void)setHasSockNetInetDgramDns:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInetDgramDns
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setSockNetInetDgramNoData:(int64_t)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_sockNetInetDgramNoData = a3;
}

- (void)setHasSockNetInetDgramNoData:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInetDgramNoData
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setSockNetInet6Stream:(int64_t)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_sockNetInet6Stream = a3;
}

- (void)setHasSockNetInet6Stream:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInet6Stream
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setSockNetInet6Dgram:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_sockNetInet6Dgram = a3;
}

- (void)setHasSockNetInet6Dgram:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInet6Dgram
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSockNetInet6DgramConnected:(int64_t)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_sockNetInet6DgramConnected = a3;
}

- (void)setHasSockNetInet6DgramConnected:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInet6DgramConnected
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setSockNetInet6DgramDns:(int64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_sockNetInet6DgramDns = a3;
}

- (void)setHasSockNetInet6DgramDns:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasSockNetInet6DgramDns
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setSockNetInet6DgramNoData:(int64_t)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_sockNetInet6DgramNoData = a3;
}

- (void)setHasSockNetInet6DgramNoData:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasSockNetInet6DgramNoData
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setSockInetMcastJoin:(int64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_sockInetMcastJoin = a3;
}

- (void)setHasSockInetMcastJoin:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasSockInetMcastJoin
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setSockInetMcastJoinOs:(int64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_sockInetMcastJoinOs = a3;
}

- (void)setHasSockInetMcastJoinOs:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasSockInetMcastJoinOs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setNexusFlowInetStream:(int64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_nexusFlowInetStream = a3;
}

- (void)setHasNexusFlowInetStream:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasNexusFlowInetStream
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setNexusFlowInetDatagram:(int64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_nexusFlowInetDatagram = a3;
}

- (void)setHasNexusFlowInetDatagram:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasNexusFlowInetDatagram
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setNexusFlowInet6Stream:(int64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_nexusFlowInet6Stream = a3;
}

- (void)setHasNexusFlowInet6Stream:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasNexusFlowInet6Stream
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setNexusFlowInet6Datagram:(int64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_nexusFlowInet6Datagram = a3;
}

- (void)setHasNexusFlowInet6Datagram:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasNexusFlowInet6Datagram
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIfnetAlloc:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_ifnetAlloc = a3;
}

- (void)setHasIfnetAlloc:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasIfnetAlloc
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIfnetAllocOs:(int64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_ifnetAllocOs = a3;
}

- (void)setHasIfnetAllocOs:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasIfnetAllocOs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setPfAddrule:(int64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_pfAddrule = a3;
}

- (void)setHasPfAddrule:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasPfAddrule
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setPfAddruleOs:(int64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_pfAddruleOs = a3;
}

- (void)setHasPfAddruleOs:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasPfAddruleOs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setVmnetStart:(int64_t)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_vmnetStart = a3;
}

- (void)setHasVmnetStart:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasVmnetStart
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setIfNetagentEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_ifNetagentEnabled = a3;
}

- (void)setHasIfNetagentEnabled:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasIfNetagentEnabled
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setTimeSinceLastReport:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_timeSinceLastReport = a3;
}

- (void)setHasTimeSinceLastReport:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($75D3FDB1FD5E5A93AFD6E48B0BEDD086)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasTimeSinceLastReport
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDNWAPIUsage;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDNWAPIUsage description](&v3, sel_description), -[AWDNWAPIUsage dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_48;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithLongLong:self->_ifFltrAttach] forKey:@"if_fltr_attach"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithLongLong:self->_ifFltrAttachOs] forKey:@"if_fltr_attach_os"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithLongLong:self->_ipFltrAdd] forKey:@"ip_fltr_add"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithLongLong:self->_ipFltrAddOs] forKey:@"ip_fltr_add_os"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockFltrRegister] forKey:@"sock_fltr_register"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockFltrRegisterOs] forKey:@"sock_fltr_register_os"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockAlloc] forKey:@"sock_alloc"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockAllocKernel] forKey:@"sock_alloc_kernel"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockAllocKernelOs] forKey:@"sock_alloc_kernel_os"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockNecpClientuuidCount] forKey:@"sock_necp_clientuuid_count"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockDomainLocal] forKey:@"sock_domain_local"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockDomainRoute] forKey:@"sock_domain_route"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockDomainInet] forKey:@"sock_domain_inet"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockDomainInet6] forKey:@"sock_domain_inet6"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockDomainSystem] forKey:@"sock_domain_system"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockDomainMultipath] forKey:@"sock_domain_multipath"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockDomainKey] forKey:@"sock_domain_key"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockDomainNdrv] forKey:@"sock_domain_ndrv"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockDomainOther] forKey:@"sock_domain_other"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockNetInetStream] forKey:@"sock_net_inet_stream"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockNetInetDgram] forKey:@"sock_net_inet_dgram"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_24:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_69;
  }
LABEL_68:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockNetInetDgramConnected] forKey:@"sock_net_inet_dgram_connected"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_70;
  }
LABEL_69:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockNetInetDgramDns] forKey:@"sock_net_inet_dgram_dns"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_71;
  }
LABEL_70:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockNetInetDgramNoData] forKey:@"sock_net_inet_dgram_no_data"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_72;
  }
LABEL_71:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockNetInet6Stream] forKey:@"sock_net_inet6_stream"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockNetInet6Dgram] forKey:@"sock_net_inet6_dgram"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockNetInet6DgramConnected] forKey:@"sock_net_inet6_dgram_connected"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_75;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockNetInet6DgramDns] forKey:@"sock_net_inet6_dgram_dns"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_76;
  }
LABEL_75:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockNetInet6DgramNoData] forKey:@"sock_net_inet6_dgram_no_data"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_77;
  }
LABEL_76:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockInetMcastJoin] forKey:@"sock_inet_mcast_join"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_34;
    }
    goto LABEL_78;
  }
LABEL_77:
  [v3 setObject:[NSNumber numberWithLongLong:self->_sockInetMcastJoinOs] forKey:@"sock_inet_mcast_join_os"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_35;
    }
    goto LABEL_79;
  }
LABEL_78:
  [v3 setObject:[NSNumber numberWithLongLong:self->_nexusFlowInetStream] forKey:@"nexus_flow_inet_stream"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_36;
    }
    goto LABEL_80;
  }
LABEL_79:
  [v3 setObject:[NSNumber numberWithLongLong:self->_nexusFlowInetDatagram] forKey:@"nexus_flow_inet_datagram"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_37;
    }
    goto LABEL_81;
  }
LABEL_80:
  [v3 setObject:[NSNumber numberWithLongLong:self->_nexusFlowInet6Stream] forKey:@"nexus_flow_inet6_stream"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_38;
    }
    goto LABEL_82;
  }
LABEL_81:
  [v3 setObject:[NSNumber numberWithLongLong:self->_nexusFlowInet6Datagram] forKey:@"nexus_flow_inet6_datagram"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_39;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v3 setObject:[NSNumber numberWithLongLong:self->_ifnetAlloc] forKey:@"ifnet_alloc"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_40;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v3 setObject:[NSNumber numberWithLongLong:self->_ifnetAllocOs] forKey:@"ifnet_alloc_os"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_41;
    }
    goto LABEL_85;
  }
LABEL_84:
  [v3 setObject:[NSNumber numberWithLongLong:self->_pfAddrule] forKey:@"pf_addrule"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_86;
  }
LABEL_85:
  [v3 setObject:[NSNumber numberWithLongLong:self->_pfAddruleOs] forKey:@"pf_addrule_os"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_43;
    }
LABEL_87:
    [v3 setObject:[NSNumber numberWithBool:self->_ifNetagentEnabled] forKey:@"if_netagent_enabled"];
    if ((*(void *)&self->_has & 0x8000000000) == 0) {
      return v3;
    }
    goto LABEL_44;
  }
LABEL_86:
  [v3 setObject:[NSNumber numberWithLongLong:self->_vmnetStart] forKey:@"vmnet_start"];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x40000000000) != 0) {
    goto LABEL_87;
  }
LABEL_43:
  if ((*(void *)&has & 0x8000000000) != 0) {
LABEL_44:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timeSinceLastReport] forKey:@"time_since_last_report"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDNWAPIUsageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_24:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_34;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_41;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_43;
    }
LABEL_86:
    PBDataWriterWriteBOOLField();
    if ((*(void *)&self->_has & 0x8000000000) == 0) {
      return;
    }
    goto LABEL_87;
  }
LABEL_85:
  PBDataWriterWriteInt64Field();
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x40000000000) != 0) {
    goto LABEL_86;
  }
LABEL_43:
  if ((*(void *)&has & 0x8000000000) == 0) {
    return;
  }
LABEL_87:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    *((void *)a3 + 41) = self->_timestamp;
    *(void *)((char *)a3 + 348) |= 0x10000000000uLL;
    $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 1) = self->_ifFltrAttach;
  *(void *)((char *)a3 + 348) |= 1uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)a3 + 2) = self->_ifFltrAttachOs;
  *(void *)((char *)a3 + 348) |= 2uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)a3 + 5) = self->_ipFltrAdd;
  *(void *)((char *)a3 + 348) |= 0x10uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)a3 + 6) = self->_ipFltrAddOs;
  *(void *)((char *)a3 + 348) |= 0x20uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)a3 + 25) = self->_sockFltrRegister;
  *(void *)((char *)a3 + 348) |= 0x1000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)a3 + 26) = self->_sockFltrRegisterOs;
  *(void *)((char *)a3 + 348) |= 0x2000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)a3 + 13) = self->_sockAlloc;
  *(void *)((char *)a3 + 348) |= 0x1000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)a3 + 14) = self->_sockAllocKernel;
  *(void *)((char *)a3 + 348) |= 0x2000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)a3 + 15) = self->_sockAllocKernelOs;
  *(void *)((char *)a3 + 348) |= 0x4000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)a3 + 29) = self->_sockNecpClientuuidCount;
  *(void *)((char *)a3 + 348) |= 0x10000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)a3 + 19) = self->_sockDomainLocal;
  *(void *)((char *)a3 + 348) |= 0x40000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)a3 + 23) = self->_sockDomainRoute;
  *(void *)((char *)a3 + 348) |= 0x400000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)a3 + 16) = self->_sockDomainInet;
  *(void *)((char *)a3 + 348) |= 0x8000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)a3 + 17) = self->_sockDomainInet6;
  *(void *)((char *)a3 + 348) |= 0x10000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)a3 + 24) = self->_sockDomainSystem;
  *(void *)((char *)a3 + 348) |= 0x800000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)a3 + 20) = self->_sockDomainMultipath;
  *(void *)((char *)a3 + 348) |= 0x80000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)a3 + 18) = self->_sockDomainKey;
  *(void *)((char *)a3 + 348) |= 0x20000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)a3 + 21) = self->_sockDomainNdrv;
  *(void *)((char *)a3 + 348) |= 0x100000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)a3 + 22) = self->_sockDomainOther;
  *(void *)((char *)a3 + 348) |= 0x200000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)a3 + 39) = self->_sockNetInetStream;
  *(void *)((char *)a3 + 348) |= 0x4000000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((void *)a3 + 35) = self->_sockNetInetDgram;
  *(void *)((char *)a3 + 348) |= 0x400000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_24:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)a3 + 36) = self->_sockNetInetDgramConnected;
  *(void *)((char *)a3 + 348) |= 0x800000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)a3 + 37) = self->_sockNetInetDgramDns;
  *(void *)((char *)a3 + 348) |= 0x1000000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)a3 + 38) = self->_sockNetInetDgramNoData;
  *(void *)((char *)a3 + 348) |= 0x2000000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)a3 + 34) = self->_sockNetInet6Stream;
  *(void *)((char *)a3 + 348) |= 0x200000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)a3 + 30) = self->_sockNetInet6Dgram;
  *(void *)((char *)a3 + 348) |= 0x20000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((void *)a3 + 31) = self->_sockNetInet6DgramConnected;
  *(void *)((char *)a3 + 348) |= 0x40000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)a3 + 32) = self->_sockNetInet6DgramDns;
  *(void *)((char *)a3 + 348) |= 0x80000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)a3 + 33) = self->_sockNetInet6DgramNoData;
  *(void *)((char *)a3 + 348) |= 0x100000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)a3 + 27) = self->_sockInetMcastJoin;
  *(void *)((char *)a3 + 348) |= 0x4000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_34;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((void *)a3 + 28) = self->_sockInetMcastJoinOs;
  *(void *)((char *)a3 + 348) |= 0x8000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((void *)a3 + 10) = self->_nexusFlowInetStream;
  *(void *)((char *)a3 + 348) |= 0x200uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((void *)a3 + 9) = self->_nexusFlowInetDatagram;
  *(void *)((char *)a3 + 348) |= 0x100uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((void *)a3 + 8) = self->_nexusFlowInet6Stream;
  *(void *)((char *)a3 + 348) |= 0x80uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((void *)a3 + 7) = self->_nexusFlowInet6Datagram;
  *(void *)((char *)a3 + 348) |= 0x40uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((void *)a3 + 3) = self->_ifnetAlloc;
  *(void *)((char *)a3 + 348) |= 4uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((void *)a3 + 4) = self->_ifnetAllocOs;
  *(void *)((char *)a3 + 348) |= 8uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_41;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((void *)a3 + 11) = self->_pfAddrule;
  *(void *)((char *)a3 + 348) |= 0x400uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((void *)a3 + 12) = self->_pfAddruleOs;
  *(void *)((char *)a3 + 348) |= 0x800uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((void *)a3 + 42) = self->_vmnetStart;
  *(void *)((char *)a3 + 348) |= 0x20000000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x8000000000) == 0) {
      return;
    }
LABEL_87:
    *((void *)a3 + 40) = self->_timeSinceLastReport;
    *(void *)((char *)a3 + 348) |= 0x8000000000uLL;
    return;
  }
LABEL_86:
  *((unsigned char *)a3 + 344) = self->_ifNetagentEnabled;
  *(void *)((char *)a3 + 348) |= 0x40000000000uLL;
  if ((*(void *)&self->_has & 0x8000000000) != 0) {
    goto LABEL_87;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    *((void *)result + 41) = self->_timestamp;
    *(void *)((char *)result + 348) |= 0x10000000000uLL;
    $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_48;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_ifFltrAttach;
  *(void *)((char *)result + 348) |= 1uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)result + 2) = self->_ifFltrAttachOs;
  *(void *)((char *)result + 348) |= 2uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)result + 5) = self->_ipFltrAdd;
  *(void *)((char *)result + 348) |= 0x10uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)result + 6) = self->_ipFltrAddOs;
  *(void *)((char *)result + 348) |= 0x20uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)result + 25) = self->_sockFltrRegister;
  *(void *)((char *)result + 348) |= 0x1000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)result + 26) = self->_sockFltrRegisterOs;
  *(void *)((char *)result + 348) |= 0x2000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)result + 13) = self->_sockAlloc;
  *(void *)((char *)result + 348) |= 0x1000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)result + 14) = self->_sockAllocKernel;
  *(void *)((char *)result + 348) |= 0x2000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)result + 15) = self->_sockAllocKernelOs;
  *(void *)((char *)result + 348) |= 0x4000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)result + 29) = self->_sockNecpClientuuidCount;
  *(void *)((char *)result + 348) |= 0x10000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)result + 19) = self->_sockDomainLocal;
  *(void *)((char *)result + 348) |= 0x40000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)result + 23) = self->_sockDomainRoute;
  *(void *)((char *)result + 348) |= 0x400000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)result + 16) = self->_sockDomainInet;
  *(void *)((char *)result + 348) |= 0x8000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)result + 17) = self->_sockDomainInet6;
  *(void *)((char *)result + 348) |= 0x10000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)result + 24) = self->_sockDomainSystem;
  *(void *)((char *)result + 348) |= 0x800000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)result + 20) = self->_sockDomainMultipath;
  *(void *)((char *)result + 348) |= 0x80000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)result + 18) = self->_sockDomainKey;
  *(void *)((char *)result + 348) |= 0x20000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)result + 21) = self->_sockDomainNdrv;
  *(void *)((char *)result + 348) |= 0x100000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)result + 22) = self->_sockDomainOther;
  *(void *)((char *)result + 348) |= 0x200000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((void *)result + 39) = self->_sockNetInetStream;
  *(void *)((char *)result + 348) |= 0x4000000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)result + 35) = self->_sockNetInetDgram;
  *(void *)((char *)result + 348) |= 0x400000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_24:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)result + 36) = self->_sockNetInetDgramConnected;
  *(void *)((char *)result + 348) |= 0x800000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)result + 37) = self->_sockNetInetDgramDns;
  *(void *)((char *)result + 348) |= 0x1000000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_26:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)result + 38) = self->_sockNetInetDgramNoData;
  *(void *)((char *)result + 348) |= 0x2000000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)result + 34) = self->_sockNetInet6Stream;
  *(void *)((char *)result + 348) |= 0x200000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((void *)result + 30) = self->_sockNetInet6Dgram;
  *(void *)((char *)result + 348) |= 0x20000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)result + 31) = self->_sockNetInet6DgramConnected;
  *(void *)((char *)result + 348) |= 0x40000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)result + 32) = self->_sockNetInet6DgramDns;
  *(void *)((char *)result + 348) |= 0x80000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)result + 33) = self->_sockNetInet6DgramNoData;
  *(void *)((char *)result + 348) |= 0x100000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((void *)result + 27) = self->_sockInetMcastJoin;
  *(void *)((char *)result + 348) |= 0x4000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_34;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((void *)result + 28) = self->_sockInetMcastJoinOs;
  *(void *)((char *)result + 348) |= 0x8000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_35;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((void *)result + 10) = self->_nexusFlowInetStream;
  *(void *)((char *)result + 348) |= 0x200uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_36;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((void *)result + 9) = self->_nexusFlowInetDatagram;
  *(void *)((char *)result + 348) |= 0x100uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_37;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((void *)result + 8) = self->_nexusFlowInet6Stream;
  *(void *)((char *)result + 348) |= 0x80uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_38;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((void *)result + 7) = self->_nexusFlowInet6Datagram;
  *(void *)((char *)result + 348) |= 0x40uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_39;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((void *)result + 3) = self->_ifnetAlloc;
  *(void *)((char *)result + 348) |= 4uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_40;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((void *)result + 4) = self->_ifnetAllocOs;
  *(void *)((char *)result + 348) |= 8uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_41;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((void *)result + 11) = self->_pfAddrule;
  *(void *)((char *)result + 348) |= 0x400uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((void *)result + 12) = self->_pfAddruleOs;
  *(void *)((char *)result + 348) |= 0x800uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((void *)result + 42) = self->_vmnetStart;
  *(void *)((char *)result + 348) |= 0x20000000000uLL;
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_43:
    if ((*(void *)&has & 0x8000000000) == 0) {
      return result;
    }
    goto LABEL_44;
  }
LABEL_87:
  *((unsigned char *)result + 344) = self->_ifNetagentEnabled;
  *(void *)((char *)result + 348) |= 0x40000000000uLL;
  if ((*(void *)&self->_has & 0x8000000000) == 0) {
    return result;
  }
LABEL_44:
  *((void *)result + 40) = self->_timeSinceLastReport;
  *(void *)((char *)result + 348) |= 0x8000000000uLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  uint64_t v7 = *(void *)((char *)a3 + 348);
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0 || self->_timestamp != *((void *)a3 + 41)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_219;
  }
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_ifFltrAttach != *((void *)a3 + 1)) {
      goto LABEL_219;
    }
  }
  else if (v7)
  {
    goto LABEL_219;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_ifFltrAttachOs != *((void *)a3 + 2)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_219;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_ipFltrAdd != *((void *)a3 + 5)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_219;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_ipFltrAddOs != *((void *)a3 + 6)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_sockFltrRegister != *((void *)a3 + 25)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_sockFltrRegisterOs != *((void *)a3 + 26)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_sockAlloc != *((void *)a3 + 13)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_sockAllocKernel != *((void *)a3 + 14)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_sockAllocKernelOs != *((void *)a3 + 15)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_sockNecpClientuuidCount != *((void *)a3 + 29)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_sockDomainLocal != *((void *)a3 + 19)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_sockDomainRoute != *((void *)a3 + 23)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_sockDomainInet != *((void *)a3 + 16)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_sockDomainInet6 != *((void *)a3 + 17)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_sockDomainSystem != *((void *)a3 + 24)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_sockDomainMultipath != *((void *)a3 + 20)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_sockDomainKey != *((void *)a3 + 18)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_sockDomainNdrv != *((void *)a3 + 21)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_sockDomainOther != *((void *)a3 + 22)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0 || self->_sockNetInetStream != *((void *)a3 + 39)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_sockNetInetDgram != *((void *)a3 + 35)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0 || self->_sockNetInetDgramConnected != *((void *)a3 + 36)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0 || self->_sockNetInetDgramDns != *((void *)a3 + 37)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0 || self->_sockNetInetDgramNoData != *((void *)a3 + 38)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_sockNetInet6Stream != *((void *)a3 + 34)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_sockNetInet6Dgram != *((void *)a3 + 30)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_sockNetInet6DgramConnected != *((void *)a3 + 31)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_sockNetInet6DgramDns != *((void *)a3 + 32)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_sockNetInet6DgramNoData != *((void *)a3 + 33)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_sockInetMcastJoin != *((void *)a3 + 27)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_sockInetMcastJoinOs != *((void *)a3 + 28)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_nexusFlowInetStream != *((void *)a3 + 10)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_nexusFlowInetDatagram != *((void *)a3 + 9)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_219;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_nexusFlowInet6Stream != *((void *)a3 + 8)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_219;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_nexusFlowInet6Datagram != *((void *)a3 + 7)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_219;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_ifnetAlloc != *((void *)a3 + 3)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_219;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_ifnetAllocOs != *((void *)a3 + 4)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_pfAddrule != *((void *)a3 + 11)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_219;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_pfAddruleOs != *((void *)a3 + 12)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_219;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0 || self->_vmnetStart != *((void *)a3 + 42)) {
      goto LABEL_219;
    }
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_219;
  }
  if ((*(void *)&has & 0x40000000000) == 0)
  {
    if ((v7 & 0x40000000000) != 0) {
      goto LABEL_219;
    }
    goto LABEL_215;
  }
  if ((v7 & 0x40000000000) == 0) {
    goto LABEL_219;
  }
  if (self->_ifNetagentEnabled)
  {
    if (!*((unsigned char *)a3 + 344)) {
      goto LABEL_219;
    }
    goto LABEL_215;
  }
  if (*((unsigned char *)a3 + 344))
  {
LABEL_219:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_215:
  LOBYTE(v5) = (v7 & 0x8000000000) == 0;
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0 || self->_timeSinceLastReport != *((void *)a3 + 40)) {
      goto LABEL_219;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $75D3FDB1FD5E5A93AFD6E48B0BEDD086 has = self->_has;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    unint64_t v46 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&has)
    {
LABEL_3:
      uint64_t v45 = 2654435761 * self->_ifFltrAttach;
      if ((*(unsigned char *)&has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else
  {
    unint64_t v46 = 0;
    if (*(unsigned char *)&has) {
      goto LABEL_3;
    }
  }
  uint64_t v45 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_4:
    uint64_t v44 = 2654435761 * self->_ifFltrAttachOs;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v44 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v43 = 2654435761 * self->_ipFltrAdd;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v43 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v42 = 2654435761 * self->_ipFltrAddOs;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v42 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_7:
    uint64_t v41 = 2654435761 * self->_sockFltrRegister;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v41 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_8:
    uint64_t v40 = 2654435761 * self->_sockFltrRegisterOs;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v40 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_9:
    uint64_t v39 = 2654435761 * self->_sockAlloc;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v39 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_10:
    uint64_t v38 = 2654435761 * self->_sockAllocKernel;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v38 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_11:
    uint64_t v37 = 2654435761 * self->_sockAllocKernelOs;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v37 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_12:
    uint64_t v36 = 2654435761 * self->_sockNecpClientuuidCount;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_13:
    uint64_t v35 = 2654435761 * self->_sockDomainLocal;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_14:
    uint64_t v34 = 2654435761 * self->_sockDomainRoute;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v34 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_15:
    uint64_t v33 = 2654435761 * self->_sockDomainInet;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_16:
    uint64_t v32 = 2654435761 * self->_sockDomainInet6;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v32 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_17:
    uint64_t v31 = 2654435761 * self->_sockDomainSystem;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_18:
    uint64_t v30 = 2654435761 * self->_sockDomainMultipath;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_19:
    uint64_t v3 = 2654435761 * self->_sockDomainKey;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v3 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_20:
    uint64_t v4 = 2654435761 * self->_sockDomainNdrv;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v4 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_21:
    uint64_t v5 = 2654435761 * self->_sockDomainOther;
    if ((*(void *)&has & 0x4000000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v5 = 0;
  if ((*(void *)&has & 0x4000000000) != 0)
  {
LABEL_22:
    uint64_t v6 = 2654435761 * self->_sockNetInetStream;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v6 = 0;
  if ((*(void *)&has & 0x400000000) != 0)
  {
LABEL_23:
    uint64_t v7 = 2654435761 * self->_sockNetInetDgram;
    if ((*(void *)&has & 0x800000000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v7 = 0;
  if ((*(void *)&has & 0x800000000) != 0)
  {
LABEL_24:
    uint64_t v8 = 2654435761 * self->_sockNetInetDgramConnected;
    if ((*(void *)&has & 0x1000000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v8 = 0;
  if ((*(void *)&has & 0x1000000000) != 0)
  {
LABEL_25:
    uint64_t v9 = 2654435761 * self->_sockNetInetDgramDns;
    if ((*(void *)&has & 0x2000000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  uint64_t v9 = 0;
  if ((*(void *)&has & 0x2000000000) != 0)
  {
LABEL_26:
    uint64_t v10 = 2654435761 * self->_sockNetInetDgramNoData;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v10 = 0;
  if ((*(void *)&has & 0x200000000) != 0)
  {
LABEL_27:
    uint64_t v11 = 2654435761 * self->_sockNetInet6Stream;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_71;
  }
LABEL_70:
  uint64_t v11 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_28:
    uint64_t v12 = 2654435761 * self->_sockNetInet6Dgram;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_29:
    uint64_t v13 = 2654435761 * self->_sockNetInet6DgramConnected;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v13 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_30:
    uint64_t v14 = 2654435761 * self->_sockNetInet6DgramDns;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v14 = 0;
  if ((*(void *)&has & 0x100000000) != 0)
  {
LABEL_31:
    uint64_t v15 = 2654435761 * self->_sockNetInet6DgramNoData;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_32:
    uint64_t v16 = 2654435761 * self->_sockInetMcastJoin;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_76;
  }
LABEL_75:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_33:
    uint64_t v17 = 2654435761 * self->_sockInetMcastJoinOs;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_34;
    }
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v17 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_34:
    uint64_t v18 = 2654435761 * self->_nexusFlowInetStream;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  uint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_35:
    uint64_t v19 = 2654435761 * self->_nexusFlowInetDatagram;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v19 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_36:
    uint64_t v20 = 2654435761 * self->_nexusFlowInet6Stream;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_37:
    uint64_t v21 = 2654435761 * self->_nexusFlowInet6Datagram;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  uint64_t v21 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_38:
    uint64_t v22 = 2654435761 * self->_ifnetAlloc;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_39:
    uint64_t v23 = 2654435761 * self->_ifnetAllocOs;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_40:
    uint64_t v24 = 2654435761 * self->_pfAddrule;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_41;
    }
    goto LABEL_84;
  }
LABEL_83:
  uint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_41:
    uint64_t v25 = 2654435761 * self->_pfAddruleOs;
    if ((*(void *)&has & 0x20000000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  uint64_t v25 = 0;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
LABEL_42:
    uint64_t v26 = 2654435761 * self->_vmnetStart;
    if ((*(void *)&has & 0x40000000000) != 0) {
      goto LABEL_43;
    }
LABEL_86:
    uint64_t v27 = 0;
    if ((*(void *)&has & 0x8000000000) != 0) {
      goto LABEL_44;
    }
LABEL_87:
    unint64_t v28 = 0;
    return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_85:
  uint64_t v26 = 0;
  if ((*(void *)&has & 0x40000000000) == 0) {
    goto LABEL_86;
  }
LABEL_43:
  uint64_t v27 = 2654435761 * self->_ifNetagentEnabled;
  if ((*(void *)&has & 0x8000000000) == 0) {
    goto LABEL_87;
  }
LABEL_44:
  unint64_t v28 = 2654435761u * self->_timeSinceLastReport;
  return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x10000000000) != 0)
  {
    self->_timestamp = *((void *)a3 + 41);
    *(void *)&self->_has |= 0x10000000000uLL;
    uint64_t v3 = *(void *)((char *)a3 + 348);
    if ((v3 & 1) == 0)
    {
LABEL_3:
      if ((v3 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else if ((v3 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_ifFltrAttach = *((void *)a3 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 2) == 0)
  {
LABEL_4:
    if ((v3 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_ifFltrAttachOs = *((void *)a3 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x10) == 0)
  {
LABEL_5:
    if ((v3 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_ipFltrAdd = *((void *)a3 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x20) == 0)
  {
LABEL_6:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_ipFltrAddOs = *((void *)a3 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_sockFltrRegister = *((void *)a3 + 25);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_8:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_sockFltrRegisterOs = *((void *)a3 + 26);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x1000) == 0)
  {
LABEL_9:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_sockAlloc = *((void *)a3 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x2000) == 0)
  {
LABEL_10:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_sockAllocKernel = *((void *)a3 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x4000) == 0)
  {
LABEL_11:
    if ((v3 & 0x10000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_sockAllocKernelOs = *((void *)a3 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_12:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_sockNecpClientuuidCount = *((void *)a3 + 29);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x40000) == 0)
  {
LABEL_13:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_sockDomainLocal = *((void *)a3 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x400000) == 0)
  {
LABEL_14:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_sockDomainRoute = *((void *)a3 + 23);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x8000) == 0)
  {
LABEL_15:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_sockDomainInet = *((void *)a3 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x10000) == 0)
  {
LABEL_16:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_sockDomainInet6 = *((void *)a3 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x800000) == 0)
  {
LABEL_17:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_sockDomainSystem = *((void *)a3 + 24);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x80000) == 0)
  {
LABEL_18:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_sockDomainMultipath = *((void *)a3 + 20);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x20000) == 0)
  {
LABEL_19:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_sockDomainKey = *((void *)a3 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x100000) == 0)
  {
LABEL_20:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_sockDomainNdrv = *((void *)a3 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x200000) == 0)
  {
LABEL_21:
    if ((v3 & 0x4000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_sockDomainOther = *((void *)a3 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x4000000000) == 0)
  {
LABEL_22:
    if ((v3 & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_sockNetInetStream = *((void *)a3 + 39);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_23:
    if ((v3 & 0x800000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_sockNetInetDgram = *((void *)a3 + 35);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x800000000) == 0)
  {
LABEL_24:
    if ((v3 & 0x1000000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_sockNetInetDgramConnected = *((void *)a3 + 36);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x1000000000) == 0)
  {
LABEL_25:
    if ((v3 & 0x2000000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_sockNetInetDgramDns = *((void *)a3 + 37);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x2000000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x200000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_sockNetInetDgramNoData = *((void *)a3 + 38);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_27:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_sockNetInet6Stream = *((void *)a3 + 34);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_28:
    if ((v3 & 0x40000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_sockNetInet6Dgram = *((void *)a3 + 30);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_29:
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_sockNetInet6DgramConnected = *((void *)a3 + 31);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_30:
    if ((v3 & 0x100000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_sockNetInet6DgramDns = *((void *)a3 + 32);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x100000000) == 0)
  {
LABEL_31:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_sockNetInet6DgramNoData = *((void *)a3 + 33);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_32:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_sockInetMcastJoin = *((void *)a3 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_33:
    if ((v3 & 0x200) == 0) {
      goto LABEL_34;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_sockInetMcastJoinOs = *((void *)a3 + 28);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x200) == 0)
  {
LABEL_34:
    if ((v3 & 0x100) == 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_nexusFlowInetStream = *((void *)a3 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x100) == 0)
  {
LABEL_35:
    if ((v3 & 0x80) == 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_nexusFlowInetDatagram = *((void *)a3 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x80) == 0)
  {
LABEL_36:
    if ((v3 & 0x40) == 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_nexusFlowInet6Stream = *((void *)a3 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x40) == 0)
  {
LABEL_37:
    if ((v3 & 4) == 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_nexusFlowInet6Datagram = *((void *)a3 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 4) == 0)
  {
LABEL_38:
    if ((v3 & 8) == 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_ifnetAlloc = *((void *)a3 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 8) == 0)
  {
LABEL_39:
    if ((v3 & 0x400) == 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_ifnetAllocOs = *((void *)a3 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x400) == 0)
  {
LABEL_40:
    if ((v3 & 0x800) == 0) {
      goto LABEL_41;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_pfAddrule = *((void *)a3 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x800) == 0)
  {
LABEL_41:
    if ((v3 & 0x20000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_pfAddruleOs = *((void *)a3 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x20000000000) == 0)
  {
LABEL_42:
    if ((v3 & 0x40000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_vmnetStart = *((void *)a3 + 42);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 348);
  if ((v3 & 0x40000000000) == 0)
  {
LABEL_43:
    if ((v3 & 0x8000000000) == 0) {
      return;
    }
LABEL_87:
    self->_timeSinceLastReport = *((void *)a3 + 40);
    *(void *)&self->_has |= 0x8000000000uLL;
    return;
  }
LABEL_86:
  self->_ifNetagentEnabled = *((unsigned char *)a3 + 344);
  *(void *)&self->_has |= 0x40000000000uLL;
  if ((*(void *)((unsigned char *)a3 + 348) & 0x8000000000) != 0) {
    goto LABEL_87;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)ifFltrAttach
{
  return self->_ifFltrAttach;
}

- (int64_t)ifFltrAttachOs
{
  return self->_ifFltrAttachOs;
}

- (int64_t)ipFltrAdd
{
  return self->_ipFltrAdd;
}

- (int64_t)ipFltrAddOs
{
  return self->_ipFltrAddOs;
}

- (int64_t)sockFltrRegister
{
  return self->_sockFltrRegister;
}

- (int64_t)sockFltrRegisterOs
{
  return self->_sockFltrRegisterOs;
}

- (int64_t)sockAlloc
{
  return self->_sockAlloc;
}

- (int64_t)sockAllocKernel
{
  return self->_sockAllocKernel;
}

- (int64_t)sockAllocKernelOs
{
  return self->_sockAllocKernelOs;
}

- (int64_t)sockNecpClientuuidCount
{
  return self->_sockNecpClientuuidCount;
}

- (int64_t)sockDomainLocal
{
  return self->_sockDomainLocal;
}

- (int64_t)sockDomainRoute
{
  return self->_sockDomainRoute;
}

- (int64_t)sockDomainInet
{
  return self->_sockDomainInet;
}

- (int64_t)sockDomainInet6
{
  return self->_sockDomainInet6;
}

- (int64_t)sockDomainSystem
{
  return self->_sockDomainSystem;
}

- (int64_t)sockDomainMultipath
{
  return self->_sockDomainMultipath;
}

- (int64_t)sockDomainKey
{
  return self->_sockDomainKey;
}

- (int64_t)sockDomainNdrv
{
  return self->_sockDomainNdrv;
}

- (int64_t)sockDomainOther
{
  return self->_sockDomainOther;
}

- (int64_t)sockNetInetStream
{
  return self->_sockNetInetStream;
}

- (int64_t)sockNetInetDgram
{
  return self->_sockNetInetDgram;
}

- (int64_t)sockNetInetDgramConnected
{
  return self->_sockNetInetDgramConnected;
}

- (int64_t)sockNetInetDgramDns
{
  return self->_sockNetInetDgramDns;
}

- (int64_t)sockNetInetDgramNoData
{
  return self->_sockNetInetDgramNoData;
}

- (int64_t)sockNetInet6Stream
{
  return self->_sockNetInet6Stream;
}

- (int64_t)sockNetInet6Dgram
{
  return self->_sockNetInet6Dgram;
}

- (int64_t)sockNetInet6DgramConnected
{
  return self->_sockNetInet6DgramConnected;
}

- (int64_t)sockNetInet6DgramDns
{
  return self->_sockNetInet6DgramDns;
}

- (int64_t)sockNetInet6DgramNoData
{
  return self->_sockNetInet6DgramNoData;
}

- (int64_t)sockInetMcastJoin
{
  return self->_sockInetMcastJoin;
}

- (int64_t)sockInetMcastJoinOs
{
  return self->_sockInetMcastJoinOs;
}

- (int64_t)nexusFlowInetStream
{
  return self->_nexusFlowInetStream;
}

- (int64_t)nexusFlowInetDatagram
{
  return self->_nexusFlowInetDatagram;
}

- (int64_t)nexusFlowInet6Stream
{
  return self->_nexusFlowInet6Stream;
}

- (int64_t)nexusFlowInet6Datagram
{
  return self->_nexusFlowInet6Datagram;
}

- (int64_t)ifnetAlloc
{
  return self->_ifnetAlloc;
}

- (int64_t)ifnetAllocOs
{
  return self->_ifnetAllocOs;
}

- (int64_t)pfAddrule
{
  return self->_pfAddrule;
}

- (int64_t)pfAddruleOs
{
  return self->_pfAddruleOs;
}

- (int64_t)vmnetStart
{
  return self->_vmnetStart;
}

- (BOOL)ifNetagentEnabled
{
  return self->_ifNetagentEnabled;
}

- (unint64_t)timeSinceLastReport
{
  return self->_timeSinceLastReport;
}

@end