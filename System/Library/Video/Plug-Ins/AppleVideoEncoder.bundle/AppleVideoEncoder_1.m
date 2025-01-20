void sub_CE400(__CVBuffer *a1, uint64_t a2)
{
  size_t extraRowsOnBottom;
  size_t extraColumnsOnRight;

  extraRowsOnBottom = 0;
  extraColumnsOnRight = 0;
  CVPixelBufferGetIOSurface(a1);
  CVPixelBufferGetExtendedPixels(a1, 0, &extraColumnsOnRight, 0, &extraRowsOnBottom);
  CVPixelBufferGetWidthOfPlane(a1, 0);
  CVPixelBufferGetHeightOfPlane(a1, 0);
  IOSurfaceGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane();
  IOSurfaceGetHTPCVerticalHeaderGroupingModeOfPlane();
  IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane();
  IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane();
  if (*(_DWORD *)(a2 + 12))
  {
    CVPixelBufferGetWidthOfPlane(a1, 1uLL);
    CVPixelBufferGetHeightOfPlane(a1, 1uLL);
    IOSurfaceGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane();
    IOSurfaceGetHTPCVerticalHeaderGroupingModeOfPlane();
    IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane();
    IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane();
  }
  operator new[]();
}

void sub_CE69C(__CVBuffer *a1, uint64_t a2)
{
  size_t extraRowsOnBottom = 0;
  size_t extraColumnsOnRight = 0;
  size_t extraRowsOnTop = 0;
  size_t extraColumnsOnLeft = 0;
  CVPixelBufferGetIOSurface(a1);
  CVPixelBufferGetExtendedPixels(a1, &extraColumnsOnLeft, &extraColumnsOnRight, &extraRowsOnTop, &extraRowsOnBottom);
  CVPixelBufferGetWidthOfPlane(a1, 0);
  CVPixelBufferGetHeightOfPlane(a1, 0);
  IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane();
  IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane();
  IOSurfaceGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane();
  IOSurfaceGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane();
  if (*(_DWORD *)(a2 + 12))
  {
    CVPixelBufferGetWidthOfPlane(a1, 1uLL);
    CVPixelBufferGetHeightOfPlane(a1, 1uLL);
    IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane();
    IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane();
    IOSurfaceGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane();
    IOSurfaceGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane();
  }
  operator new[]();
}

uint64_t sub_CE970(CVPixelBufferRef pixelBuffer, int a2, FILE *a3)
{
  if (pixelBuffer && a3)
  {
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
    v7 = sub_D7E18(PixelFormatType);
    if (v7)
    {
      switch(*((_DWORD *)v7 + 6))
      {
        case 0:
          sub_CDF18(pixelBuffer, v7, a3);
          return 0;
        case 1:
          return sub_CE114(pixelBuffer, v7);
        case 2:
          sub_CE400(pixelBuffer, (uint64_t)v7);
        case 3:
          sub_CE69C(pixelBuffer, (uint64_t)v7);
        default:
          return 4294966295;
      }
    }
    if (sub_D1C38(3u, 4))
    {
      int v12 = sub_D1C7C(3u);
      __uint64_t v13 = sub_DDEFC();
      v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | failed to get pixel format details %p %d %p 0x%x\n", v13, 3, v14, "AVE_PixelBuf_Dump", 391, "pPixelFmt != __null", pixelBuffer, a2, a3, PixelFormatType);
        __uint64_t v15 = sub_DDEFC();
        v18 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | failed to get pixel format details %p %d %p 0x%x", v15, 3, v18, "AVE_PixelBuf_Dump");
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | failed to get pixel format details %p %d %p 0x%x", v13, 3, v14, "AVE_PixelBuf_Dump");
      }
    }
    return 4294966296;
  }
  else
  {
    if (sub_D1C38(3u, 4))
    {
      int v8 = sub_D1C7C(3u);
      __uint64_t v9 = sub_DDEFC();
      v10 = (const char *)sub_D1CB0(4);
      if (v8)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameters %p %d %p\n", v9, 3, v10, "AVE_PixelBuf_Dump", 384, "pPixelBuf != __null && pFile != __null", pixelBuffer, a2, a3);
        __uint64_t v11 = sub_DDEFC();
        v17 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameters %p %d %p", v11, 3, v17);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameters %p %d %p", v9, 3, v10);
      }
    }
    return 4294966295;
  }
}

uint64_t sub_CEC3C()
{
  CFDictionaryRef v0 = IOServiceMatching("AppleAVE2Driver");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (MatchingService)
  {
    IOObjectRelease(MatchingService);
    return 0;
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      int v3 = sub_D1C7C(0x23u);
      __uint64_t v4 = sub_DDEFC();
      v5 = (const char *)sub_D1CB0(4);
      if (v3)
      {
        printf("%lld %d AVE %s: %s:%d %s | can not find matched driver\n", v4, 35, v5, "AVE_UC_Verify", 23, "pService != 0");
        __uint64_t v6 = sub_DDEFC();
        v7 = (const char *)sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | can not find matched driver", v6, 35, v7, "AVE_UC_Verify", 23, "pService != 0");
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | can not find matched driver", v4, 35, v5, "AVE_UC_Verify", 23, "pService != 0");
      }
    }
    return 4294966291;
  }
}

uint64_t sub_CED5C(uint32_t a1, void *a2)
{
  kern_return_t v7;
  uint64_t v8;
  int v9;
  __uint64_t v10;
  const char *v11;
  __uint64_t v12;
  int v13;
  __uint64_t v14;
  const char *v15;
  int v16;
  __uint64_t v17;
  const char *v18;
  __uint64_t v19;
  BOOL v20;
  void *v22;
  io_connect_t connect;

  connect = 0;
  if (a2)
  {
    CFDictionaryRef v4 = IOServiceMatching("AppleAVE2Driver");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v4);
    if (MatchingService)
    {
      io_service_t v6 = MatchingService;
      kdebug_trace();
      v7 = IOServiceOpen(v6, mach_task_self_, a1, &connect);
      int v8 = sub_DDFC8(v7);
      kdebug_trace();
      if (v8)
      {
        if (sub_D1C38(0x23u, 4))
        {
          __uint64_t v9 = sub_D1C7C(0x23u);
          v10 = sub_DDEFC();
          __uint64_t v11 = (const char *)sub_D1CB0(4);
          if (v9)
          {
            printf("%lld %d AVE %s: %s:%d %s | fail to open driver %d %p 0x%x %d\n", v10, 35, v11, "AVE_UC_Create", 67, "ret == 0", a1, a2, v7, v8);
            int v12 = sub_DDEFC();
            v22 = sub_D1CB0(4);
            syslog(3, "%lld %d AVE %s: %s:%d %s | fail to open driver %d %p 0x%x %d", v12, 35, v22);
          }
          else
          {
            syslog(3, "%lld %d AVE %s: %s:%d %s | fail to open driver %d %p 0x%x %d", v10, 35, v11);
          }
        }
      }
      else
      {
        *a2 = connect;
      }
      IOObjectRelease(v6);
      if (v8) {
        v20 = connect == 0;
      }
      else {
        v20 = 1;
      }
      if (!v20) {
        IOServiceClose(connect);
      }
    }
    else
    {
      if (sub_D1C38(0x23u, 4))
      {
        v16 = sub_D1C7C(0x23u);
        v17 = sub_DDEFC();
        v18 = (const char *)sub_D1CB0(4);
        if (v16)
        {
          printf("%lld %d AVE %s: %s:%d %s | can not find matched driver %d %p\n", v17, 35, v18, "AVE_UC_Create", 57, "pService != 0", a1, a2);
          v19 = sub_DDEFC();
          sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | can not find matched driver %d %p", v19, 35);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | can not find matched driver %d %p", v17, 35);
        }
      }
      return 4294966291;
    }
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      __uint64_t v13 = sub_D1C7C(0x23u);
      v14 = sub_DDEFC();
      __uint64_t v15 = (const char *)sub_D1CB0(4);
      if (v13)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %d %p\n", v14, 35, v15, "AVE_UC_Create", 51, "ppUC != __null", a1, 0);
        v14 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %d %p", v14, 35);
    }
    return 4294966295;
  }
  return v8;
}

uint64_t sub_CF100(const void *a1)
{
  kern_return_t v2;
  uint64_t v3;
  int v4;
  __uint64_t v5;
  const char *v6;
  int v7;
  __uint64_t v8;
  const char *v9;

  if (a1)
  {
    kdebug_trace();
    v2 = IOServiceClose((io_connect_t)a1);
    int v3 = sub_DDFC8(v2);
    if (v3)
    {
      if (sub_D1C38(0x23u, 4))
      {
        CFDictionaryRef v4 = sub_D1C7C(0x23u);
        v5 = sub_DDEFC();
        io_service_t v6 = (const char *)sub_D1CB0(4);
        if (v4)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to close driver %p 0x%x %d\n", v5, 35, v6, "AVE_UC_Destroy", 113, "ret == 0", a1, v2, v3);
          v5 = sub_DDEFC();
          sub_D1CB0(4);
        }
        syslog(3, "%lld %d AVE %s: %s:%d %s | fail to close driver %p 0x%x %d", v5, 35);
      }
    }
    else
    {
      kdebug_trace();
    }
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      v7 = sub_D1C7C(0x23u);
      int v8 = sub_DDEFC();
      __uint64_t v9 = (const char *)sub_D1CB0(4);
      if (v7)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p\n", v8, 35, v9, "AVE_UC_Destroy", 105, "pUC != __null", 0);
        int v8 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p", v8);
    }
    return 4294966295;
  }
  return v3;
}

uint64_t sub_CF340(const void *a1, const void *a2, void *a3)
{
  kern_return_t v6;
  uint64_t v7;
  int v8;
  __uint64_t v9;
  const char *v10;
  __uint64_t v11;
  int v12;
  __uint64_t v13;
  const char *v14;
  __uint64_t v15;
  int v16;
  __uint64_t v17;
  const char *v18;
  __uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  size_t outputStructCnt;

  outputStructCnt = 40;
  if (a1 && a2 && a3)
  {
    kdebug_trace();
    io_service_t v6 = IOConnectCallStructMethod((mach_port_t)a1, 1u, a2, 0x6E0uLL, a3, &outputStructCnt);
    v7 = sub_DDFC8(v6);
    kdebug_trace();
    if (v7)
    {
      if (sub_D1C38(0x23u, 4))
      {
        int v8 = sub_D1C7C(0x23u);
        __uint64_t v9 = sub_DDEFC();
        v10 = (const char *)sub_D1CB0(4);
        if (v8)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to open client %p %p %p 0x%x\n", v9, 35, v10, "AVE_UC_Open", 155, "ret == 0", a1, a2, a3, v6);
          __uint64_t v11 = sub_DDEFC();
          v21 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to open client %p %p %p 0x%x", v11, 35, v21, "AVE_UC_Open");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to open client %p %p %p 0x%x", v9, 35, v10, "AVE_UC_Open");
        }
      }
    }
    else if (outputStructCnt <= 0x27)
    {
      if (sub_D1C38(0x23u, 4))
      {
        v16 = sub_D1C7C(0x23u);
        v17 = sub_DDEFC();
        v18 = (const char *)sub_D1CB0(4);
        if (v16)
        {
          printf("%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d\n", v17, 35, v18, "AVE_UC_Open", 159, "outSize >= sizeof(S_AVE_UCOutParam_Open)", a1, a2, a3, outputStructCnt, 40);
          v19 = sub_DDEFC();
          v23 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v19, 35, v23, "AVE_UC_Open");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v17, 35, v18, "AVE_UC_Open");
        }
      }
      return 4294966281;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      int v12 = sub_D1C7C(0x23u);
      __uint64_t v13 = sub_DDEFC();
      v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p\n", v13, 35, v14, "AVE_UC_Open", 142, "pUC != __null && pIn != __null && pOut != __null", a1, a2, a3);
        __uint64_t v15 = sub_DDEFC();
        v22 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v15, 35, v22);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v13, 35, v14);
      }
    }
    return 4294966295;
  }
  return v7;
}

uint64_t sub_CF6C4(const void *a1, const void *a2, void *a3)
{
  kern_return_t v6;
  uint64_t v7;
  int v8;
  __uint64_t v9;
  const char *v10;
  __uint64_t v11;
  int v12;
  __uint64_t v13;
  const char *v14;
  __uint64_t v15;
  int v16;
  __uint64_t v17;
  const char *v18;
  __uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  size_t outputStructCnt;

  outputStructCnt = 32;
  if (a1 && a2 && a3)
  {
    kdebug_trace();
    io_service_t v6 = IOConnectCallStructMethod((mach_port_t)a1, 2u, a2, 0x28uLL, a3, &outputStructCnt);
    v7 = sub_DDFC8(v6);
    kdebug_trace();
    if (v7)
    {
      if (sub_D1C38(0x23u, 4))
      {
        int v8 = sub_D1C7C(0x23u);
        __uint64_t v9 = sub_DDEFC();
        v10 = (const char *)sub_D1CB0(4);
        if (v8)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to close client %p %p %p 0x%x %d\n", v9, 35, v10, "AVE_UC_Close", 197, "ret == 0", a1, a2, a3, v6, v7);
          __uint64_t v11 = sub_DDEFC();
          v21 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to close client %p %p %p 0x%x %d", v11, 35, v21, "AVE_UC_Close");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to close client %p %p %p 0x%x %d", v9, 35, v10, "AVE_UC_Close");
        }
      }
    }
    else if (outputStructCnt <= 0x1F)
    {
      if (sub_D1C38(0x23u, 4))
      {
        v16 = sub_D1C7C(0x23u);
        v17 = sub_DDEFC();
        v18 = (const char *)sub_D1CB0(4);
        if (v16)
        {
          printf("%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d\n", v17, 35, v18, "AVE_UC_Close", 201, "outSize >= sizeof(S_AVE_UCOutParam_Close)", a1, a2, a3, outputStructCnt, 32);
          v19 = sub_DDEFC();
          v23 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v19, 35, v23, "AVE_UC_Close");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v17, 35, v18, "AVE_UC_Close");
        }
      }
      return 4294966281;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      int v12 = sub_D1C7C(0x23u);
      __uint64_t v13 = sub_DDEFC();
      v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p\n", v13, 35, v14, "AVE_UC_Close", 184, "pUC != __null && pIn != __null && pOut != __null", a1, a2, a3);
        __uint64_t v15 = sub_DDEFC();
        v22 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v15, 35, v22);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v13, 35, v14);
      }
    }
    return 4294966295;
  }
  return v7;
}

uint64_t sub_CFA58(const void *a1, const void *a2, const void *a3, void *a4)
{
  kern_return_t v8;
  uint64_t v9;
  int v10;
  __uint64_t v11;
  const char *v12;
  __uint64_t v13;
  int v14;
  __uint64_t v15;
  const char *v16;
  __uint64_t v17;
  int v18;
  __uint64_t v19;
  const char *v20;
  __uint64_t v21;
  void *v23;
  void *v24;
  void *v25;
  size_t v26;
  uint64_t reference[2];
  long long v28;
  long long v29;
  long long v30;

  v29 = 0u;
  v30 = 0u;
  *(_OWORD *)reference = 0u;
  v28 = 0u;
  v26 = 32;
  if (a1 && a2 && a3 && a4)
  {
    kdebug_trace();
    int v8 = IOConnectCallAsyncMethod((mach_port_t)a1, 3u, (mach_port_t)a2, reference, 8u, 0, 0, a3, 0x38uLL, 0, 0, a4, &v26);
    __uint64_t v9 = sub_DDFC8(v8);
    kdebug_trace();
    if (v9)
    {
      if (sub_D1C38(0x23u, 4))
      {
        v10 = sub_D1C7C(0x23u);
        __uint64_t v11 = sub_DDEFC();
        int v12 = (const char *)sub_D1CB0(4);
        if (v10)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to config %p %p %p 0x%x %d\n", v11, 35, v12, "AVE_UC_Config", 243, "ret == 0", a1, a3, a4, v8, v9);
          __uint64_t v13 = sub_DDEFC();
          v23 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to config %p %p %p 0x%x %d", v13, 35, v23, "AVE_UC_Config");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to config %p %p %p 0x%x %d", v11, 35, v12, "AVE_UC_Config");
        }
      }
    }
    else if (v26 <= 0x1F)
    {
      if (sub_D1C38(0x23u, 4))
      {
        v18 = sub_D1C7C(0x23u);
        v19 = sub_DDEFC();
        v20 = (const char *)sub_D1CB0(4);
        if (v18)
        {
          printf("%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d\n", v19, 35, v20, "AVE_UC_Config", 247, "outSize >= sizeof(S_AVE_UCOutParam_Config)", a1, a3, a4, v26, 32);
          v21 = sub_DDEFC();
          v25 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v21, 35, v25, "AVE_UC_Config");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v19, 35, v20, "AVE_UC_Config");
        }
      }
      return 4294966281;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      v14 = sub_D1C7C(0x23u);
      __uint64_t v15 = sub_DDEFC();
      v16 = (const char *)sub_D1CB0(4);
      if (v14)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p %p\n", v15, 35, v16, "AVE_UC_Config", 229, "pUC != __null && pRecvPort != __null && pIn != __null && pOut != __null", a1, a2, a3, a4);
        v17 = sub_DDEFC();
        v24 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p %p", v17, 35, v24, "AVE_UC_Config");
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p %p", v15, 35, v16, "AVE_UC_Config");
      }
    }
    return 4294966295;
  }
  return v9;
}

uint64_t sub_CFE50(const void *a1, const void *a2, void *a3)
{
  kern_return_t v6;
  uint64_t v7;
  int v8;
  __uint64_t v9;
  const char *v10;
  __uint64_t v11;
  int v12;
  __uint64_t v13;
  const char *v14;
  __uint64_t v15;
  int v16;
  __uint64_t v17;
  const char *v18;
  __uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  size_t outputStructCnt;

  outputStructCnt = 32;
  if (a1 && a2 && a3)
  {
    kdebug_trace();
    io_service_t v6 = IOConnectCallStructMethod((mach_port_t)a1, 4u, a2, 0x2DFE8uLL, a3, &outputStructCnt);
    v7 = sub_DDFC8(v6);
    kdebug_trace();
    if (v7)
    {
      if (sub_D1C38(0x23u, 4))
      {
        int v8 = sub_D1C7C(0x23u);
        __uint64_t v9 = sub_DDEFC();
        v10 = (const char *)sub_D1CB0(4);
        if (v8)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to prepare %p %p %p 0x%x %d\n", v9, 35, v10, "AVE_UC_Prepare", 285, "ret == 0", a1, a2, a3, v6, v7);
          __uint64_t v11 = sub_DDEFC();
          v21 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to prepare %p %p %p 0x%x %d", v11, 35, v21, "AVE_UC_Prepare");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to prepare %p %p %p 0x%x %d", v9, 35, v10, "AVE_UC_Prepare");
        }
      }
    }
    else if (outputStructCnt <= 0x1F)
    {
      if (sub_D1C38(0x23u, 4))
      {
        v16 = sub_D1C7C(0x23u);
        v17 = sub_DDEFC();
        v18 = (const char *)sub_D1CB0(4);
        if (v16)
        {
          printf("%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d\n", v17, 35, v18, "AVE_UC_Prepare", 289, "outSize >= sizeof(S_AVE_UCOutParam_Prepare)", a1, a2, a3, outputStructCnt, 32);
          v19 = sub_DDEFC();
          v23 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v19, 35, v23, "AVE_UC_Prepare");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v17, 35, v18, "AVE_UC_Prepare");
        }
      }
      return 4294966281;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      int v12 = sub_D1C7C(0x23u);
      __uint64_t v13 = sub_DDEFC();
      v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p\n", v13, 35, v14, "AVE_UC_Prepare", 272, "pUC != __null && pIn != __null && pOut != __null", a1, a2, a3);
        __uint64_t v15 = sub_DDEFC();
        v22 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v15, 35, v22);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v13, 35, v14);
      }
    }
    return 4294966295;
  }
  return v7;
}

uint64_t sub_D01E8(const void *a1, const void *a2, void *a3)
{
  kern_return_t v6;
  uint64_t v7;
  int v8;
  __uint64_t v9;
  const char *v10;
  __uint64_t v11;
  int v12;
  __uint64_t v13;
  const char *v14;
  __uint64_t v15;
  int v16;
  __uint64_t v17;
  const char *v18;
  __uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  size_t outputStructCnt;

  outputStructCnt = 720;
  if (a1 && a2 && a3)
  {
    kdebug_trace();
    io_service_t v6 = IOConnectCallStructMethod((mach_port_t)a1, 5u, a2, 0x2DFE8uLL, a3, &outputStructCnt);
    v7 = sub_DDFC8(v6);
    kdebug_trace();
    if (v7)
    {
      if (sub_D1C38(0x23u, 4))
      {
        int v8 = sub_D1C7C(0x23u);
        __uint64_t v9 = sub_DDEFC();
        v10 = (const char *)sub_D1CB0(4);
        if (v8)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to start %p %p %p 0x%x %d\n", v9, 35, v10, "AVE_UC_Start", 327, "ret == 0", a1, a2, a3, v6, v7);
          __uint64_t v11 = sub_DDEFC();
          v21 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to start %p %p %p 0x%x %d", v11, 35, v21, "AVE_UC_Start");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to start %p %p %p 0x%x %d", v9, 35, v10, "AVE_UC_Start");
        }
      }
    }
    else if (outputStructCnt <= 0x2CF)
    {
      if (sub_D1C38(0x23u, 4))
      {
        v16 = sub_D1C7C(0x23u);
        v17 = sub_DDEFC();
        v18 = (const char *)sub_D1CB0(4);
        if (v16)
        {
          printf("%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d\n", v17, 35, v18, "AVE_UC_Start", 331, "outSize >= sizeof(S_AVE_UCOutParam_Start)", a1, a2, a3, outputStructCnt, 720);
          v19 = sub_DDEFC();
          v23 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v19, 35, v23, "AVE_UC_Start");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v17, 35, v18, "AVE_UC_Start");
        }
      }
      return 4294966281;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      int v12 = sub_D1C7C(0x23u);
      __uint64_t v13 = sub_DDEFC();
      v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p\n", v13, 35, v14, "AVE_UC_Start", 314, "pUC != __null && pIn != __null && pOut != __null", a1, a2, a3);
        __uint64_t v15 = sub_DDEFC();
        v22 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v15, 35, v22);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v13, 35, v14);
      }
    }
    return 4294966295;
  }
  return v7;
}

uint64_t sub_D0580(const void *a1, const void *a2, void *a3)
{
  kern_return_t v6;
  uint64_t v7;
  int v8;
  __uint64_t v9;
  const char *v10;
  __uint64_t v11;
  int v12;
  __uint64_t v13;
  const char *v14;
  __uint64_t v15;
  int v16;
  __uint64_t v17;
  const char *v18;
  __uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  size_t outputStructCnt;

  outputStructCnt = 32;
  if (a1 && a2 && a3)
  {
    kdebug_trace();
    io_service_t v6 = IOConnectCallStructMethod((mach_port_t)a1, 6u, a2, 0x30uLL, a3, &outputStructCnt);
    v7 = sub_DDFC8(v6);
    kdebug_trace();
    if (v7)
    {
      if (sub_D1C38(0x23u, 4))
      {
        int v8 = sub_D1C7C(0x23u);
        __uint64_t v9 = sub_DDEFC();
        v10 = (const char *)sub_D1CB0(4);
        if (v8)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to stop %p %p %p 0x%x %d\n", v9, 35, v10, "AVE_UC_Stop", 369, "ret == 0", a1, a2, a3, v6, v7);
          __uint64_t v11 = sub_DDEFC();
          v21 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to stop %p %p %p 0x%x %d", v11, 35, v21, "AVE_UC_Stop");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to stop %p %p %p 0x%x %d", v9, 35, v10, "AVE_UC_Stop");
        }
      }
    }
    else if (outputStructCnt <= 0x1F)
    {
      if (sub_D1C38(0x23u, 4))
      {
        v16 = sub_D1C7C(0x23u);
        v17 = sub_DDEFC();
        v18 = (const char *)sub_D1CB0(4);
        if (v16)
        {
          printf("%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d\n", v17, 35, v18, "AVE_UC_Stop", 373, "outSize >= sizeof(S_AVE_UCOutParam_Stop)", a1, a2, a3, outputStructCnt, 32);
          v19 = sub_DDEFC();
          v23 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v19, 35, v23, "AVE_UC_Stop");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v17, 35, v18, "AVE_UC_Stop");
        }
      }
      return 4294966281;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      int v12 = sub_D1C7C(0x23u);
      __uint64_t v13 = sub_DDEFC();
      v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p\n", v13, 35, v14, "AVE_UC_Stop", 356, "pUC != __null && pIn != __null && pOut != __null", a1, a2, a3);
        __uint64_t v15 = sub_DDEFC();
        v22 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v15, 35, v22);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v13, 35, v14);
      }
    }
    return 4294966295;
  }
  return v7;
}

uint64_t sub_D0914(const void *a1, const void *a2, void *a3)
{
  kern_return_t v6;
  uint64_t v7;
  int v8;
  __uint64_t v9;
  const char *v10;
  __uint64_t v11;
  int v12;
  __uint64_t v13;
  const char *v14;
  __uint64_t v15;
  int v16;
  __uint64_t v17;
  const char *v18;
  __uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  size_t outputStructCnt;

  outputStructCnt = 32;
  if (a1 && a2 && a3)
  {
    kdebug_trace();
    io_service_t v6 = IOConnectCallStructMethod((mach_port_t)a1, 7u, a2, 0x30uLL, a3, &outputStructCnt);
    v7 = sub_DDFC8(v6);
    kdebug_trace();
    if (v7)
    {
      if (sub_D1C38(0x23u, 4))
      {
        int v8 = sub_D1C7C(0x23u);
        __uint64_t v9 = sub_DDEFC();
        v10 = (const char *)sub_D1CB0(4);
        if (v8)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to process %p %p %p 0x%x %d\n", v9, 35, v10, "AVE_UC_Process", 411, "ret == 0", a1, a2, a3, v6, v7);
          __uint64_t v11 = sub_DDEFC();
          v21 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to process %p %p %p 0x%x %d", v11, 35, v21, "AVE_UC_Process");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to process %p %p %p 0x%x %d", v9, 35, v10, "AVE_UC_Process");
        }
      }
    }
    else if (outputStructCnt <= 0x1F)
    {
      if (sub_D1C38(0x23u, 4))
      {
        v16 = sub_D1C7C(0x23u);
        v17 = sub_DDEFC();
        v18 = (const char *)sub_D1CB0(4);
        if (v16)
        {
          printf("%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d\n", v17, 35, v18, "AVE_UC_Process", 415, "outSize >= sizeof(S_AVE_UCOutParam_Process)", a1, a2, a3, outputStructCnt, 32);
          v19 = sub_DDEFC();
          v23 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v19, 35, v23, "AVE_UC_Process");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v17, 35, v18, "AVE_UC_Process");
        }
      }
      return 4294966281;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      int v12 = sub_D1C7C(0x23u);
      __uint64_t v13 = sub_DDEFC();
      v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p\n", v13, 35, v14, "AVE_UC_Process", 398, "pUC != __null && pIn != __null && pOut != __null", a1, a2, a3);
        __uint64_t v15 = sub_DDEFC();
        v22 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v15, 35, v22);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v13, 35, v14);
      }
    }
    return 4294966295;
  }
  return v7;
}

uint64_t sub_D0CA8(const void *a1, const void *a2, void *a3)
{
  kern_return_t v6;
  uint64_t v7;
  int v8;
  __uint64_t v9;
  const char *v10;
  __uint64_t v11;
  int v12;
  __uint64_t v13;
  const char *v14;
  __uint64_t v15;
  int v16;
  __uint64_t v17;
  const char *v18;
  __uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  size_t outputStructCnt;

  outputStructCnt = 32;
  if (a1 && a2 && a3)
  {
    kdebug_trace();
    io_service_t v6 = IOConnectCallStructMethod((mach_port_t)a1, 8u, a2, 0x30uLL, a3, &outputStructCnt);
    v7 = sub_DDFC8(v6);
    kdebug_trace();
    if (v7)
    {
      if (sub_D1C38(0x23u, 4))
      {
        int v8 = sub_D1C7C(0x23u);
        __uint64_t v9 = sub_DDEFC();
        v10 = (const char *)sub_D1CB0(4);
        if (v8)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to complete %p %p %p 0x%x %d\n", v9, 35, v10, "AVE_UC_Complete", 453, "ret == 0", a1, a2, a3, v6, v7);
          __uint64_t v11 = sub_DDEFC();
          v21 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to complete %p %p %p 0x%x %d", v11, 35, v21, "AVE_UC_Complete");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to complete %p %p %p 0x%x %d", v9, 35, v10, "AVE_UC_Complete");
        }
      }
    }
    else if (outputStructCnt <= 0x1F)
    {
      if (sub_D1C38(0x23u, 4))
      {
        v16 = sub_D1C7C(0x23u);
        v17 = sub_DDEFC();
        v18 = (const char *)sub_D1CB0(4);
        if (v16)
        {
          printf("%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d\n", v17, 35, v18, "AVE_UC_Complete", 457, "outSize >= sizeof(S_AVE_UCOutParam_Complete)", a1, a2, a3, outputStructCnt, 32);
          v19 = sub_DDEFC();
          v23 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v19, 35, v23, "AVE_UC_Complete");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v17, 35, v18, "AVE_UC_Complete");
        }
      }
      return 4294966281;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      int v12 = sub_D1C7C(0x23u);
      __uint64_t v13 = sub_DDEFC();
      v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p\n", v13, 35, v14, "AVE_UC_Complete", 440, "pUC != __null && pIn != __null && pOut != __null", a1, a2, a3);
        __uint64_t v15 = sub_DDEFC();
        v22 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v15, 35, v22);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v13, 35, v14);
      }
    }
    return 4294966295;
  }
  return v7;
}

uint64_t sub_D103C(const void *a1, const void *a2, void *a3)
{
  kern_return_t v6;
  uint64_t v7;
  int v8;
  __uint64_t v9;
  const char *v10;
  __uint64_t v11;
  int v12;
  __uint64_t v13;
  const char *v14;
  __uint64_t v15;
  int v16;
  __uint64_t v17;
  const char *v18;
  __uint64_t v19;
  void *v21;
  void *v22;
  void *v23;
  size_t outputStructCnt;

  outputStructCnt = 32;
  if (a1 && a2 && a3)
  {
    kdebug_trace();
    io_service_t v6 = IOConnectCallStructMethod((mach_port_t)a1, 0xAu, a2, 0x30uLL, a3, &outputStructCnt);
    v7 = sub_DDFC8(v6);
    kdebug_trace();
    if (v7)
    {
      if (sub_D1C38(0x23u, 4))
      {
        int v8 = sub_D1C7C(0x23u);
        __uint64_t v9 = sub_DDEFC();
        v10 = (const char *)sub_D1CB0(4);
        if (v8)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to reset %p %p %p 0x%x %d\n", v9, 35, v10, "AVE_UC_Reset", 537, "ret == 0", a1, a2, a3, v6, v7);
          __uint64_t v11 = sub_DDEFC();
          v21 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to reset %p %p %p 0x%x %d", v11, 35, v21, "AVE_UC_Reset");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to reset %p %p %p 0x%x %d", v9, 35, v10, "AVE_UC_Reset");
        }
      }
    }
    else if (outputStructCnt <= 0x1F)
    {
      if (sub_D1C38(0x23u, 4))
      {
        v16 = sub_D1C7C(0x23u);
        v17 = sub_DDEFC();
        v18 = (const char *)sub_D1CB0(4);
        if (v16)
        {
          printf("%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d\n", v17, 35, v18, "AVE_UC_Reset", 541, "outSize >= sizeof(S_AVE_UCOutParam_Reset)", a1, a2, a3, outputStructCnt, 32);
          v19 = sub_DDEFC();
          v23 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v19, 35, v23, "AVE_UC_Reset");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | invalid out parameter %p %p %p %d %d", v17, 35, v18, "AVE_UC_Reset");
        }
      }
      return 4294966281;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (sub_D1C38(0x23u, 4))
    {
      int v12 = sub_D1C7C(0x23u);
      __uint64_t v13 = sub_DDEFC();
      v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p\n", v13, 35, v14, "AVE_UC_Reset", 524, "pUC != __null && pIn != __null && pOut != __null", a1, a2, a3);
        __uint64_t v15 = sub_DDEFC();
        v22 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v15, 35, v22);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v13, 35, v14);
      }
    }
    return 4294966295;
  }
  return v7;
}

uint64_t sub_D13D0(CFDictionaryRef theDict, uint64_t a2)
{
  BOOL v19 = 0;
  memset(v20, 0, sizeof(v20));
  if (theDict && a2)
  {
    *(void *)(a2 + 80) = 0;
    *(_OWORD *)a2 = 0uLL;
    *(_OWORD *)(a2 + 64) = 0uLL;
    *(_OWORD *)(a2 + 48) = 0uLL;
    *(_OWORD *)(a2 + 32) = 0uLL;
    *(_OWORD *)(a2 + 16) = 0uLL;
    sub_C3E5C(theDict, kFigCaptureStreamMetadata_SNR, (void *)a2);
    sub_C3E5C(theDict, kFigCaptureStreamMetadata_NormalizedSNR, (void *)(a2 + 8));
    sub_C3E5C(theDict, kFigCaptureStreamMetadata_ExposureTime, (void *)(a2 + 16));
    sub_C3E5C(theDict, kFigCaptureStreamMetadata_AGC, (void *)(a2 + 24));
    sub_C3E5C(theDict, kFigCaptureStreamMetadata_ispDGain, (void *)(a2 + 32));
    sub_C3E5C(theDict, kFigCaptureStreamMetadata_sensorDGain, (void *)(a2 + 40));
    sub_C3E5C(theDict, kFigCaptureStreamMetadata_ispDGainRangeExpansionFactor, (void *)(a2 + 48));
    CFDictionaryRef v4 = (double *)(a2 + 56);
    sub_C3E5C(theDict, kFigCaptureStreamMetadata_ScalingFactor, (void *)(a2 + 56));
    sub_C43BC(theDict, kFigCaptureStreamMetadata_SensorID, (_DWORD *)(a2 + 64));
    sub_C43BC(theDict, kFigCaptureStreamMetadata_LuxLevel, (_DWORD *)(a2 + 68));
    if (sub_C43BC(theDict, kFigCaptureStreamMetadata_TemporalNoiseReductionBand0Strength, (_DWORD *)(a2 + 72)) == -1008)*(_DWORD *)(a2 + 72) = -1; {
    uint64_t v5 = sub_C38FC(theDict, kFigCaptureStreamMetadata_TemporalNoiseReductionBand0StrengthModulationEnabled, &v19);
    }
    int v6 = v19;
    if (v5 == -1008) {
      int v6 = -1;
    }
    *(_DWORD *)(a2 + 76) = v6;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(theDict, kFigCaptureStreamMetadata_PortType);
    if (Value)
    {
      int v8 = sub_C491C(Value, (char *)v20, 32);
      if (v8)
      {
        __uint64_t v9 = v8;
        uint64_t v10 = 0;
        while (strcmp(v9, *(const char **)((char *)&off_159E70 + v10)))
        {
          v10 += 16;
          if (v10 == 80)
          {
            int v11 = 0;
            goto LABEL_21;
          }
        }
        int v11 = *(_DWORD *)((char *)&off_159E70 + v10 + 8);
LABEL_21:
        *(_DWORD *)(a2 + 80) = v11;
        if (sub_D1C38(0x37u, 6))
        {
          int v16 = sub_D1C7C(0x37u);
          __uint64_t v17 = sub_DDEFC();
          v18 = (const char *)sub_D1CB0(6);
          if (v16)
          {
            printf("%lld %d AVE %s: %s:%d SF: %f Port: %s %d\n", v17, 55, v18, "AVE_ISP_RetrieveMetadata", 123, *v4, v9, v11);
            __uint64_t v17 = sub_DDEFC();
            sub_D1CB0(6);
          }
          syslog(3, "%lld %d AVE %s: %s:%d SF: %f Port: %s %d", v17);
        }
      }
    }
  }
  else
  {
    if (sub_D1C38(0x37u, 4))
    {
      int v12 = sub_D1C7C(0x37u);
      __uint64_t v13 = sub_DDEFC();
      v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p\n", v13, 55, v14, "AVE_ISP_RetrieveMetadata", 75, "pDict != __null && pData != __null", theDict, (const void *)a2);
        __uint64_t v13 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p", v13, 55);
    }
    return 4294966295;
  }
  return v5;
}

uint64_t sub_D17D4(__CVBuffer *a1)
{
  if (a1)
  {
    CFDictionaryRef v1 = (const __CFDictionary *)sub_D190C(a1);
    uint64_t v2 = 4294966288;
    if (v1)
    {
      CFDictionaryRef v3 = v1;
      if (CFDictionaryContainsKey(v1, kFigCaptureStreamMetadata_SensorID)) {
        uint64_t v2 = 0;
      }
      else {
        uint64_t v2 = 4294966288;
      }
      CFRelease(v3);
    }
  }
  else
  {
    if (sub_D1C38(0x37u, 4))
    {
      int v4 = sub_D1C7C(0x37u);
      __uint64_t v5 = sub_DDEFC();
      int v6 = (const char *)sub_D1CB0(4);
      if (v4)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p\n", v5, 55, v6, "AVE_ISP_CheckMetadata", 216, "pImgBuf != __null", 0);
        __uint64_t v5 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p", v5);
    }
    return 4294966295;
  }
  return v2;
}

const void *sub_D190C(__CVBuffer *a1)
{
  CFDictionaryRef v1 = CVBufferCopyAttachments(a1, kCVAttachmentMode_ShouldPropagate);
  if (!v1) {
    return 0;
  }
  CFDictionaryRef v2 = v1;
  CFStringRef Value = CFDictionaryGetValue(v1, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary);
  int v4 = Value;
  if (Value) {
    CFRetain(Value);
  }
  CFRelease(v2);
  return v4;
}

uint64_t sub_D196C(__CVBuffer *a1, const void *a2)
{
  if (a1 && a2)
  {
    CFDictionaryRef v4 = (const __CFDictionary *)sub_D190C(a1);
    if (v4)
    {
      CFDictionaryRef v5 = v4;
      uint64_t v6 = sub_D13D0(v4, (uint64_t)a2);
      CFRelease(v5);
      return v6;
    }
    else
    {
      return 4294966288;
    }
  }
  else
  {
    if (sub_D1C38(0x37u, 4))
    {
      int v8 = sub_D1C7C(0x37u);
      __uint64_t v9 = sub_DDEFC();
      uint64_t v10 = (const char *)sub_D1CB0(4);
      if (v8)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p\n", v9, 55, v10, "AVE_ISP_GetMetadata", 252, "pImgBuf != __null && pData != __null", a1, a2);
        __uint64_t v9 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p", v9, 55);
    }
    return 4294966295;
  }
}

uint64_t sub_D1ABC(char *a1, int a2)
{
  NSTemporaryDirectory();
  id v4 = objc_claimAutoreleasedReturnValue();
  char v5 = [v4 UTF8String];

  return sub_DD92C(a1, a2, "%s", v6, v7, v8, v9, v10, v5);
}

void sub_D1B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_D1B34(unsigned int a1, int a2)
{
  if (a1 > 0xFF) {
    return 4294966295;
  }
  char v5 = a2;
  if (!a2) {
    char v5 = *((unsigned char *)&xmmword_1606D0 + a1);
  }
  byte_1607D8[a1] = v5;
  if ((byte_160818 & 0xFu) >= 7)
  {
    char v6 = byte_160818;
    __uint64_t v7 = sub_DDEFC();
    if ((v6 & 0x10) != 0)
    {
      printf("%lld %d AVE %s: %s:%d %d 0x%x\n", v7, 64, "VERB", "AVE_Log_UpdateConf", 116, a1, a2);
      __uint64_t v7 = sub_DDEFC();
    }
    syslog(3, "%lld %d AVE %s: %s:%d %d 0x%x", v7, 64, "VERB", "AVE_Log_UpdateConf", 116, a1, a2);
  }
  return 0;
}

BOOL sub_D1C38(unsigned int a1, int a2)
{
  if (a2 >= 0) {
    LOBYTE(v2) = a2;
  }
  else {
    int v2 = -a2;
  }
  return a1 < 5 || a1 <= 0xFF && (v2 & 0xFu) <= (byte_1607D8[a1] & 0xFu);
}

uint64_t sub_D1C7C(unsigned int a1)
{
  if (a1 < 2) {
    return 1;
  }
  if (a1 <= 0xFF) {
    return byte_1607D8[a1] & 0x10;
  }
  return 0;
}

void *sub_D1CB0(int a1)
{
  if (a1 >= 0) {
    LOBYTE(v1) = a1;
  }
  else {
    int v1 = -a1;
  }
  unsigned int v2 = v1 & 0xF;
  if (v2 > 8) {
    return &unk_133235;
  }
  else {
    return *(&off_159EC0 + v2);
  }
}

uint64_t sub_D1CE0()
{
  if (!qword_1608E0)
  {
    *(void *)&long long v0 = 0x505050505050505;
    *((void *)&v0 + 1) = 0x505050505050505;
    xmmword_1606F0 = v0;
    unk_160700 = v0;
    xmmword_1607B0 = v0;
    unk_1607C0 = v0;
    xmmword_160790 = v0;
    unk_1607A0 = v0;
    xmmword_160770 = v0;
    unk_160780 = v0;
    xmmword_160750 = v0;
    unk_160760 = v0;
    xmmword_160730 = v0;
    unk_160740 = v0;
    xmmword_160710 = v0;
    unk_160720 = v0;
    xmmword_1606D0 = v0;
    unk_1606E0 = v0;
    BYTE4(xmmword_1606D0) = 6;
    BYTE12(xmmword_1606F0) = 6;
    byte_16070D = 6;
    byte_1606E4 = 6;
    BYTE5(xmmword_160730) = 6;
    BYTE1(xmmword_160710) = 6;
    dword_1607D4 = 20;
    dword_1607D0 = 25;
    byte_1606E8 = 6;
    sub_3428(byte_1607D8, (char *)&xmmword_1606D0, 256);
    dword_1608DC = dword_1607D4;
    dword_1608D8 = dword_1607D0;
    qword_1608E0 = 1;
  }
  return 0;
}

uint64_t sub_D1DA0()
{
  return 0;
}

uint64_t sub_D1DA8(int a1)
{
  if ((byte_160818 & 0xEu) > 5)
  {
    char v2 = byte_160818;
    __uint64_t v3 = sub_DDEFC();
    if ((v2 & 0x10) != 0)
    {
      printf("%lld %d AVE %s: %s Enter %d\n", v3, 64, "INFO", "AVE_Log_UpdateConsole", a1);
      __uint64_t v3 = sub_DDEFC();
    }
    syslog(3, "%lld %d AVE %s: %s Enter %d", v3, 64, "INFO", "AVE_Log_UpdateConsole", a1);
  }
  for (uint64_t i = 0; i != 256; ++i)
    byte_1607D8[i] = byte_1607D8[i] & 0xEF | (16 * ((byte_1607D8[i] & 0xF) <= a1));
  qword_1608E0 = sub_DDF34();
  sub_D1F00();
  if ((byte_160818 & 0xEu) >= 6)
  {
    char v5 = byte_160818;
    __uint64_t v6 = sub_DDEFC();
    if ((v5 & 0x10) != 0)
    {
      printf("%lld %d AVE %s: %s Exit %d %d\n", v6, 64, "INFO", "AVE_Log_UpdateConsole", a1, 0);
      __uint64_t v6 = sub_DDEFC();
    }
    syslog(3, "%lld %d AVE %s: %s Exit %d %d", v6, 64, "INFO", "AVE_Log_UpdateConsole", a1, 0);
  }
  return 0;
}

void sub_D1F00()
{
  if ((byte_160818 & 0xFu) >= 7)
  {
    char v0 = byte_160818;
    __uint64_t v1 = sub_DDEFC();
    if ((v0 & 0x10) != 0)
    {
      printf("%lld %d AVE %s: %s:%d %llu\n", v1, 64, "VERB", "AVE_Log_Print", 85, qword_1608E0);
      __uint64_t v1 = sub_DDEFC();
    }
    syslog(3, "%lld %d AVE %s: %s:%d %llu", v1, 64, "VERB", "AVE_Log_Print", 85, qword_1608E0);
  }
  for (uint64_t i = 0; i != 256; ++i)
  {
    if ((byte_160818 & 0xFu) >= 7)
    {
      char v3 = byte_160818;
      __uint64_t v4 = sub_DDEFC();
      int v5 = byte_1607D8[i];
      if ((v3 & 0x10) != 0)
      {
        printf("%lld %d AVE %s: Log Cfg: %3d = 0x%02x\n", v4, 64, "VERB", i, v5);
        __uint64_t v4 = sub_DDEFC();
        int v5 = byte_1607D8[i];
      }
      syslog(3, "%lld %d AVE %s: Log Cfg: %3d = 0x%02x", v4, 64, "VERB", i, v5);
    }
  }
  if ((byte_160818 & 0xFu) >= 7)
  {
    char v6 = byte_160818;
    __uint64_t v7 = sub_DDEFC();
    if ((v6 & 0x10) != 0)
    {
      printf("%lld %d AVE %s: Log Cfg: %d %d\n", v7, 64, "VERB", dword_1608DC, dword_1608D8);
      __uint64_t v7 = sub_DDEFC();
    }
    syslog(3, "%lld %d AVE %s: Log Cfg: %d %d", v7, 64, "VERB", dword_1608DC, dword_1608D8);
  }
}

uint64_t sub_D20E4(void *a1, uint64_t a2)
{
  uint64_t result = 4294966295;
  if (a1)
  {
    if (a2)
    {
      *a1 = qword_1608E0;
      sub_3428((unsigned char *)a2, byte_1607D8, 256);
      uint64_t result = 0;
      *(_DWORD *)(a2 + 256) = dword_1608D8;
      *(_DWORD *)(a2 + 260) = dword_1608DC;
    }
  }
  return result;
}

uint64_t sub_D2150(uint64_t a1, int a2, int a3)
{
  for (unsigned int i = 5; i != 256; ++i)
  {
    unint64_t v7 = (unint64_t)i >> 3;
    if ((int)v7 >= a2) {
      break;
    }
    if ((*(unsigned __int8 *)(a1 + v7) >> (i & 7))) {
      sub_D1B34(i, a3);
    }
  }
  return 0;
}

uint64_t sub_D21C0(unsigned int a1, unint64_t a2)
{
  memset(v17, 0, sizeof(v17));
  if ((byte_160818 & 0xEu) >= 6)
  {
    char v5 = byte_160818;
    __uint64_t v6 = sub_DDEFC();
    if ((v5 & 0x10) != 0)
    {
      printf("%lld %d AVE %s: %s Enter 0x%x 0x%llx\n", v6, 64, "INFO", "AVE_Log_PresetCfg", a1, a2);
      __uint64_t v6 = sub_DDEFC();
    }
    syslog(3, "%lld %d AVE %s: %s Enter 0x%x 0x%llx", v6, 64, "INFO", "AVE_Log_PresetCfg", a1, a2);
  }
  unsigned int v7 = a1 >> 2;
  if (a2)
  {
    uint64_t v8 = 0;
    int v9 = (v7 & 0x3FFFFFC0) - 64;
    do
    {
      if (v9 + (int)v8 > 255) {
        break;
      }
      *((unsigned char *)v17 + (v9 + (int)v8) / 8) |= ((a2 >> v8) & 1) << (v9 + v8 - (v2 & 0xF8));
      ++v8;
    }
    while (v8 != 64);
    sub_D2150((uint64_t)v17, 32, a1);
  }
  else
  {
    int v10 = v7 & 0x3FFFFFC0;
    int v11 = (v7 & 0x3FFFFFC0) - 64;
    int v12 = 320 - v10;
    if ((unint64_t)(v11 - 192) >= 0xFFFFFFFFFFFFFF00) {
      int v13 = 64;
    }
    else {
      int v13 = v12;
    }
    sub_3428(&byte_1607D8[v11], (char *)&xmmword_1606D0 + v11, v13);
  }
  if ((a1 & 0xFFFFFEFF) != 0) {
    qword_1608E0 = sub_DDF34();
  }
  sub_D1F00();
  if ((byte_160818 & 0xEu) >= 6)
  {
    char v14 = byte_160818;
    __uint64_t v15 = sub_DDEFC();
    if ((v14 & 0x10) != 0)
    {
      printf("%lld %d AVE %s: %s Exit 0x%x 0x%llx %d\n", v15, 64, "INFO", "AVE_Log_PresetCfg", a1, a2, 0);
      __uint64_t v15 = sub_DDEFC();
    }
    syslog(3, "%lld %d AVE %s: %s Exit 0x%x 0x%llx %d", v15, 64, "INFO", "AVE_Log_PresetCfg", a1, a2, 0);
  }
  return 0;
}

uint64_t sub_D23E0(uint64_t a1)
{
  memset(v54, 0, 192);
  memset(&v53, 0, sizeof(v53));
  uint64_t v52 = 0;
  char v51 = 0;
  size_t v50 = 0;
  qword_160068[0] = 0;
  qword_160070 = 0;
  if (a1) {
    qword_160068[0] = a1;
  }
  int v1 = sub_D1ABC(v54, 192);
  if (v1 >= 1)
  {
    sub_DD92C(&v54[v1], 192 - v1, "%s", v2, v3, v4, v5, v6, (char)"ave_log.cfg");
    qword_160070 = (uint64_t)v54;
  }
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = (const char *)qword_160068[v7];
    if (v8) {
      break;
    }
LABEL_27:
    if (++v7 == 4)
    {
      if ((byte_160818 & 8) != 0)
      {
        char v22 = byte_160818;
        __uint64_t v23 = sub_DDEFC();
        if ((v22 & 0x10) != 0)
        {
          printf("%lld %d AVE %s: cannot find available config file\n", v23, 64, "DBG");
          __uint64_t v23 = sub_DDEFC();
        }
        syslog(3, "%lld %d AVE %s: cannot find available config file", v23, 64, "DBG");
      }
      return 4294966288;
    }
  }
  if (stat((const char *)qword_160068[v7], &v53))
  {
    if ((byte_160818 & 8) != 0)
    {
      char v9 = byte_160818;
      __uint64_t v10 = sub_DDEFC();
      if ((v9 & 0x10) != 0)
      {
        printf("%lld %d AVE %s: log config file doesn't exist at %s\n", v10, 64, "DBG", v8);
        sub_DDEFC();
      }
      syslog(3, "%lld %d AVE %s: log config file doesn't exist at %s");
    }
    goto LABEL_27;
  }
  if ((byte_160818 & 8) != 0)
  {
    char v11 = byte_160818;
    __uint64_t v12 = sub_DDEFC();
    if ((v11 & 0x10) != 0)
    {
      printf("%lld %d AVE %s: log config file is at %s\n", v12, 64, "DBG", v8);
      __uint64_t v12 = sub_DDEFC();
    }
    syslog(3, "%lld %d AVE %s: log config file is at %s", v12, 64, "DBG", v8);
  }
  uint64_t v13 = v53.st_mtimespec.tv_nsec / 1000 + 1000000 * v53.st_mtimespec.tv_sec;
  if (v13 == qword_1608E0 && qword_1608E0)
  {
    if ((byte_160818 & 8) != 0)
    {
      char v14 = byte_160818;
      __uint64_t v15 = sub_DDEFC();
      if ((v14 & 0x10) != 0)
      {
        printf("%lld %d AVE %s: log config file has been updated %s %llu\n", v15, 64, "DBG", v8, qword_1608E0);
        sub_DDEFC();
      }
      syslog(3, "%lld %d AVE %s: log config file has been updated %s %llu");
    }
    goto LABEL_27;
  }
  int v16 = fopen(v8, "r");
  if (!v16)
  {
    if ((byte_160818 & 8) != 0)
    {
      char v17 = byte_160818;
      __uint64_t v18 = sub_DDEFC();
      BOOL v19 = __error();
      v20 = strerror(*v19);
      if ((v17 & 0x10) != 0)
      {
        printf("%lld %d AVE %s: log config file cannot be opened %s : %s\n", v18, 64, "DBG", v8, v20);
        sub_DDEFC();
        v21 = __error();
        strerror(*v21);
      }
      syslog(3, "%lld %d AVE %s: log config file cannot be opened %s : %s");
    }
    goto LABEL_27;
  }
  v26 = v16;
  v27 = (char *)malloc_type_malloc(0x108uLL, 0x10000400BDB4DB4uLL);
  if (v27)
  {
    v28 = v27;
    if ((byte_160818 & 0xFu) >= 5)
    {
      char v29 = byte_160818;
      __uint64_t v30 = sub_DDEFC();
      if ((v29 & 0x10) != 0)
      {
        printf("%lld %d AVE %s: used log config file is at %s %llu\n", v30, 64, "WARN", v8, v13);
        __uint64_t v30 = sub_DDEFC();
      }
      syslog(3, "%lld %d AVE %s: used log config file is at %s %llu", v30, 64, "WARN", v8, v13);
    }
    qword_1608E0 = v13;
    size_t v50 = 0;
    v31 = fgetln(v26, &v50);
    if (v31)
    {
      v32 = v31;
      v33 = v28 + 256;
      v34 = v28 + 260;
      do
      {
        unsigned int v35 = *v32;
        BOOL v36 = v35 > 0x23;
        uint64_t v37 = (1 << v35) & 0x800002400;
        if (v36 || v37 == 0)
        {
          LODWORD(v52) = 15;
          char v51 = 0;
          if (sscanf(v32, "LOG_ID_%d=%d%c", (char *)&v52 + 4, &v52, &v51) == 3)
          {
            char v39 = v52;
            if ((v51 & 0xDF) == 0x43) {
              char v39 = v52 | 0x10;
            }
            v28[SHIDWORD(v52)] = v39;
          }
          else if (sscanf(v32, "THRESHOLD=%d", v28 + 256) == 1)
          {
            v40 = &dword_1607D0;
            if (*v33) {
              v40 = (int *)(v28 + 256);
            }
            dword_1608D8 = *v40;
            if ((byte_160818 & 0xFu) >= 7)
            {
              char v41 = byte_160818;
              __uint64_t v42 = sub_DDEFC();
              if ((v41 & 0x10) != 0)
              {
                printf("%lld %d AVE %s: %s:%d Read threshold %d\n", v42, 64, "VERB", "AVE_Log_ReadCfg", 717, *v33);
                sub_DDEFC();
              }
              syslog(3, "%lld %d AVE %s: %s:%d Read threshold %d");
            }
          }
          else if (sscanf(v32, "INTERVAL=%d", v28 + 260) == 1)
          {
            v43 = &dword_1607D4;
            if (*v34) {
              v43 = (int *)(v28 + 260);
            }
            dword_1608DC = *v43;
            if ((byte_160818 & 0xFu) >= 7)
            {
              char v44 = byte_160818;
              __uint64_t v45 = sub_DDEFC();
              if ((v44 & 0x10) != 0)
              {
                printf("%lld %d AVE %s: %s:%d Read interval %d\n", v45, 64, "VERB", "AVE_Log_ReadCfg", 724, *v34);
                sub_DDEFC();
              }
              syslog(3, "%lld %d AVE %s: %s:%d Read interval %d");
            }
          }
        }
        size_t v50 = 0;
        v32 = fgetln(v26, &v50);
      }
      while (v32);
    }
    for (uint64_t i = 0; i != 256; ++i)
    {
      v47 = &v28[i];
      if (!v28[i]) {
        v47 = v28;
      }
      sub_D1B34(i, *v47);
    }
    sub_D1F00();
    free(v28);
    uint64_t v24 = 0;
  }
  else
  {
    if ((byte_160818 & 8) != 0)
    {
      char v48 = byte_160818;
      __uint64_t v49 = sub_DDEFC();
      if ((v48 & 0x10) != 0)
      {
        printf("%lld %d AVE %s: cannot allocate memory for log config\n", v49, 64, "DBG");
        __uint64_t v49 = sub_DDEFC();
      }
      syslog(3, "%lld %d AVE %s: cannot allocate memory for log config", v49, 64, "DBG");
    }
    uint64_t v24 = 4294966293;
  }
  fclose(v26);
  return v24;
}

uint64_t sub_D2B08(uint64_t result)
{
  if (result)
  {
    int v1 = (_DWORD *)result;
    if (*(unsigned char *)(result + 44)) {
      uint64_t v2 = result + 44;
    }
    else {
      uint64_t v2 = 0;
    }
    uint64_t result = sub_D23E0(v2);
    int v3 = 256;
    for (uint64_t i = 2; i != 10; i += 2)
    {
      if ((*v1 & v3) != 0)
      {
        sub_D21C0(v3 + 7, *(void *)&v1[i]);
        uint64_t result = 0;
      }
      v3 += 256;
    }
    int v5 = v1[10];
    if (v5)
    {
      sub_D1DA8((char)v5);
      return 0;
    }
  }
  return result;
}

float sub_D2B94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  unsigned int v4 = 0;
  double v5 = 0.0;
  double v6 = 0.0;
  do
  {
    unsigned int v7 = *(_DWORD *)(a2 + 16 + v3);
    *(double *)&unint64_t v8 = (double)v7;
    v4 += v7;
    LODWORD(v8) = *(_DWORD *)(a3 + 16 + v3);
    double v6 = v6 + (double)v7 - (double)v8;
    double v9 = -v6;
    if (v6 >= 0.0) {
      double v9 = v6;
    }
    double v5 = v5 + v9;
    v3 += 4;
  }
  while (v3 != 1024);
  if (sub_D1C38(0xD8u, 7))
  {
    int v10 = sub_D1C7C(0xD8u);
    __uint64_t v11 = sub_DDEFC();
    __uint64_t v12 = (const char *)sub_D1CB0(7);
    if (v10)
    {
      printf("%lld %d AVE %s: MP: histogram_diff() hdiff %lf sum_a %d\n", v11, 216, v12, v5, v4);
      __uint64_t v13 = sub_DDEFC();
      __uint64_t v15 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: MP: histogram_diff() hdiff %lf sum_a %d", v13, 216, v15, v5, v4);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: MP: histogram_diff() hdiff %lf sum_a %d", v11, 216, v12, v5, v4);
    }
  }
  return v5 / (double)v4;
}

BOOL sub_D2CB8(float a1, float a2, float a3, float a4)
{
  double v4 = a2;
  double v5 = a3;
  if (v4 <= 0.00272072)
  {
    BOOL v9 = a4 <= 0.96605313 && v5 > 1.34009841;
  }
  else
  {
    double v6 = a1;
    if (v6 <= 71.5876885)
    {
      BOOL v7 = v6 > 26.7539587;
      double v8 = 23.2484817;
    }
    else
    {
      BOOL v7 = v4 <= 0.03005953;
      double v8 = 4.51769352;
    }
    BOOL v9 = v5 > v8 && v7;
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v10 = sub_D1C7C(0xD8u);
    __uint64_t v11 = sub_DDEFC();
    __uint64_t v12 = (const char *)sub_D1CB0(7);
    if (v10)
    {
      printf("%lld %d AVE %s: MP: scene_change_detect() returns %d\n", v11, 216, v12, v9);
      __uint64_t v13 = sub_DDEFC();
      __uint64_t v15 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: MP: scene_change_detect() returns %d", v13, 216, v15, v9);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: MP: scene_change_detect() returns %d", v11, 216, v12, v9);
    }
  }
  return v9;
}

void sub_D2E00(uint64_t a1, uint64_t a2)
{
  if (sub_D1C38(0xD8u, 7))
  {
    int v4 = sub_D1C7C(0xD8u);
    __uint64_t v5 = sub_DDEFC();
    double v6 = (const char *)sub_D1CB0(7);
    int v7 = *(_DWORD *)(a2 + 44);
    if (v4)
    {
      printf("%lld %d AVE %s: MP: accumulate_scene_info() display_order %d\n", v5, 216, v6, v7);
      __uint64_t v8 = sub_DDEFC();
      __uint64_t v30 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: MP: accumulate_scene_info() display_order %d", v8, 216, v30, *(_DWORD *)(a2 + 44));
    }
    else
    {
      syslog(3, "%lld %d AVE %s: MP: accumulate_scene_info() display_order %d", v5, 216, v6, v7);
    }
  }
  if (*(_DWORD *)(a2 + 44) != -1)
  {
    unsigned int v9 = *(_DWORD *)(a1 + 25500) + 1;
    *(_DWORD *)(a1 + 25500) = v9;
    if (*(_DWORD *)(a2 + 1200)) {
      ++*(_DWORD *)(a1 + 25496);
    }
    uint64_t v10 = *(unsigned int *)(a2 + 64);
    *(void *)(a1 + 25504) += v10;
    if (*(_DWORD *)(a2 + 52) == 2)
    {
      *(void *)(a1 + 25516) += v10;
      ++*(_DWORD *)(a1 + 25512);
      double v11 = *(float *)(a2 + 1556);
      *(double *)(a1 + 25576) = *(double *)(a1 + 25576) + v11;
    }
    else
    {
      double v11 = *(float *)(a2 + 1556);
    }
    __uint64_t v12 = (int32x2_t *)(a2 + 1220);
    double v13 = *(double *)(a1 + 25760) + v11;
    *(double *)(a1 + 25760) = v13;
    *(float *)&double v13 = v13 / (double)v9;
    *(_DWORD *)(a1 + 25572) = LODWORD(v13);
    *(float64x2_t *)(a1 + 25584) = vaddq_f64(*(float64x2_t *)(a1 + 25584), vcvtq_f64_f32(*(float32x2_t *)(a2 + 1560)));
    char v14 = (float *)(a2 + 1460);
    __uint64_t v15 = (float *)(a1 + 25664);
    uint64_t v16 = 16;
    do
    {
      *((_DWORD *)v15 - 16) += *((_DWORD *)v14 - 16);
      float v17 = *v14++;
      *__uint64_t v15 = v17 + *v15;
      ++v15;
      --v16;
    }
    while (v16);
    switch(*(_WORD *)(a2 + 1572))
    {
      case 0:
        *(void *)(a1 + 25528) += *(unsigned int *)(a2 + 64);
        ++*(_DWORD *)(a1 + 25524);
        break;
      case 1:
        *(void *)(a1 + 25540) += *(unsigned int *)(a2 + 64);
        ++*(_DWORD *)(a1 + 25536);
        break;
      case 2:
        *(void *)(a1 + 25552) += *(unsigned int *)(a2 + 64);
        ++*(_DWORD *)(a1 + 25548);
        break;
      case 3:
        *(void *)(a1 + 25564) += *(unsigned int *)(a2 + 64);
        ++*(_DWORD *)(a1 + 25560);
        break;
      default:
        break;
    }
    if (!*(_DWORD *)(a2 + 1200))
    {
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)(a1 + 25488);
      float v20 = (float)*(void *)(v19 + 1220);
      float v21 = (float)v12->u32[0];
      int32x2_t v22 = vadd_s32(*(int32x2_t *)(v19 + 1220), *v12);
      *(int32x2_t *)(v19 + 1220) = v22;
      *(int64x2_t *)(v19 + 1228) = vaddq_s64(*(int64x2_t *)(v19 + 1228), *(int64x2_t *)(a2 + 1228));
      *(int64x2_t *)(v19 + 1244) = vaddq_s64(*(int64x2_t *)(v19 + 1244), *(int64x2_t *)(a2 + 1244));
      *(void *)(v19 + 1260) += *(void *)(a2 + 1260);
      uint64_t v23 = *(void *)(v19 + 1292) + *(void *)(a2 + 1292);
      *(float *)(v19 + 1216) = (float)((float)(*(float *)(a2 + 1216) * v21) + (float)(*(float *)(v19 + 1216) * v20))
                             / (float)v22.u32[0];
      *(float64x2_t *)(v19 + 1268) = vaddq_f64(*(float64x2_t *)(a2 + 1268), *(float64x2_t *)(v19 + 1268));
      float v24 = *(float *)(a2 + 1284);
      if (v24 >= *(float *)(v19 + 1284)) {
        float v24 = *(float *)(v19 + 1284);
      }
      *(float *)(v19 + 1284) = v24;
      float v25 = *(float *)(v19 + 1288);
      if (v25 < *(float *)(a2 + 1288)) {
        float v25 = *(float *)(a2 + 1288);
      }
      *(float *)(v19 + 1288) = v25;
      *(void *)(v19 + 1292) = v23;
      int64x2_t v26 = vaddq_s64(*(int64x2_t *)(v19 + 1316), *(int64x2_t *)(a2 + 1316));
      *(int32x4_t *)(v19 + 1300) = vaddq_s32(*(int32x4_t *)(v19 + 1300), *(int32x4_t *)(a2 + 1300));
      *(int64x2_t *)(v19 + 1316) = v26;
      float64x2_t v27 = vaddq_f64(*(float64x2_t *)(a2 + 1348), *(float64x2_t *)(v19 + 1348));
      *(int64x2_t *)(v19 + 1332) = vaddq_s64(*(int64x2_t *)(v19 + 1332), *(int64x2_t *)(a2 + 1332));
      *(float64x2_t *)(v19 + 1348) = v27;
      float64x2_t v28 = vaddq_f64(*(float64x2_t *)(v19 + 1380), vcvtq_f64_f32(*(float32x2_t *)(a2 + 1560)));
      *(float64x2_t *)(v19 + 1364) = vaddq_f64(*(float64x2_t *)(a2 + 1364), *(float64x2_t *)(v19 + 1364));
      *(float64x2_t *)(v19 + 1380) = v28;
      do
      {
        uint64_t v29 = v19 + v18;
        *(_DWORD *)(v29 + 1396) = *(_DWORD *)(v19 + v18 + 1396) + *(_DWORD *)(a2 + v18 + 1396);
        *(float *)(v29 + 1460) = *(float *)(a2 + v18 + 1460) + *(float *)(v19 + v18 + 1460);
        v18 += 4;
      }
      while (v18 != 64);
    }
    sub_D31D4(a1);
  }
}

void sub_D31D4(uint64_t a1)
{
  uint64_t v2 = (int *)(a1 + 25496);
  if (sub_D1C38(0xD8u, 7))
  {
    int v3 = sub_D1C7C(0xD8u);
    __uint64_t v4 = sub_DDEFC();
    __uint64_t v5 = (const char *)sub_D1CB0(7);
    if (v3)
    {
      printf("%lld %d AVE %s: MP: seq_rc_info()\n", v4, 216, v5);
      __uint64_t v6 = sub_DDEFC();
      v71 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: MP: seq_rc_info()", v6, 216, v71);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: MP: seq_rc_info()", v4, 216, v5);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v7 = sub_D1C7C(0xD8u);
    __uint64_t v8 = sub_DDEFC();
    unsigned int v9 = (const char *)sub_D1CB0(7);
    int v10 = *v2;
    if (v7)
    {
      printf("%lld %d AVE %s:  total_scenes %u\n", v8, 216, v9, v10);
      __uint64_t v11 = sub_DDEFC();
      v72 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s:  total_scenes %u", v11, 216, v72, *v2);
    }
    else
    {
      syslog(3, "%lld %d AVE %s:  total_scenes %u", v8, 216, v9, v10);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v12 = sub_D1C7C(0xD8u);
    __uint64_t v13 = sub_DDEFC();
    char v14 = (const char *)sub_D1CB0(7);
    int v15 = v2[1];
    if (v12)
    {
      printf("%lld %d AVE %s:  cnt_All %u\n", v13, 216, v14, v15);
      __uint64_t v16 = sub_DDEFC();
      v73 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s:  cnt_All %u", v16, 216, v73, v2[1]);
    }
    else
    {
      syslog(3, "%lld %d AVE %s:  cnt_All %u", v13, 216, v14, v15);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v17 = sub_D1C7C(0xD8u);
    __uint64_t v18 = sub_DDEFC();
    uint64_t v19 = (const char *)sub_D1CB0(7);
    uint64_t v20 = *(void *)(a1 + 25504);
    if (v17)
    {
      printf("%lld %d AVE %s:  bits_All %llu\n", v18, 216, v19, v20);
      __uint64_t v21 = sub_DDEFC();
      v74 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s:  bits_All %llu", v21, 216, v74, *(void *)(a1 + 25504));
    }
    else
    {
      syslog(3, "%lld %d AVE %s:  bits_All %llu", v18, 216, v19, v20);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v22 = sub_D1C7C(0xD8u);
    __uint64_t v23 = sub_DDEFC();
    float v24 = (const char *)sub_D1CB0(7);
    int v25 = v2[7];
    if (v22)
    {
      printf("%lld %d AVE %s:  cnt_NORMAL %u\n", v23, 216, v24, v25);
      __uint64_t v26 = sub_DDEFC();
      v75 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s:  cnt_NORMAL %u", v26, 216, v75, v2[7]);
    }
    else
    {
      syslog(3, "%lld %d AVE %s:  cnt_NORMAL %u", v23, 216, v24, v25);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v27 = sub_D1C7C(0xD8u);
    __uint64_t v28 = sub_DDEFC();
    uint64_t v29 = (const char *)sub_D1CB0(7);
    uint64_t v30 = *(void *)(a1 + 25528);
    if (v27)
    {
      printf("%lld %d AVE %s:  bits_NORMAL %llu\n", v28, 216, v29, v30);
      __uint64_t v31 = sub_DDEFC();
      v76 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s:  bits_NORMAL %llu", v31, 216, v76, *(void *)(a1 + 25528));
    }
    else
    {
      syslog(3, "%lld %d AVE %s:  bits_NORMAL %llu", v28, 216, v29, v30);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v32 = sub_D1C7C(0xD8u);
    __uint64_t v33 = sub_DDEFC();
    v34 = (const char *)sub_D1CB0(7);
    int v35 = v2[10];
    if (v32)
    {
      printf("%lld %d AVE %s:  cnt_MIN %u\n", v33, 216, v34, v35);
      __uint64_t v36 = sub_DDEFC();
      v77 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s:  cnt_MIN %u", v36, 216, v77, v2[10]);
    }
    else
    {
      syslog(3, "%lld %d AVE %s:  cnt_MIN %u", v33, 216, v34, v35);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v37 = sub_D1C7C(0xD8u);
    __uint64_t v38 = sub_DDEFC();
    char v39 = (const char *)sub_D1CB0(7);
    uint64_t v40 = *(void *)(v2 + 11);
    if (v37)
    {
      printf("%lld %d AVE %s:  bits_MIN %llu\n", v38, 216, v39, v40);
      __uint64_t v41 = sub_DDEFC();
      v78 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s:  bits_MIN %llu", v41, 216, v78, *(void *)(v2 + 11));
    }
    else
    {
      syslog(3, "%lld %d AVE %s:  bits_MIN %llu", v38, 216, v39, v40);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v42 = sub_D1C7C(0xD8u);
    __uint64_t v43 = sub_DDEFC();
    char v44 = (const char *)sub_D1CB0(7);
    int v45 = v2[13];
    if (v42)
    {
      printf("%lld %d AVE %s:  cnt_MAX %u\n", v43, 216, v44, v45);
      __uint64_t v46 = sub_DDEFC();
      v79 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s:  cnt_MAX %u", v46, 216, v79, v2[13]);
    }
    else
    {
      syslog(3, "%lld %d AVE %s:  cnt_MAX %u", v43, 216, v44, v45);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v47 = sub_D1C7C(0xD8u);
    __uint64_t v48 = sub_DDEFC();
    __uint64_t v49 = (const char *)sub_D1CB0(7);
    uint64_t v50 = *(void *)(a1 + 25552);
    if (v47)
    {
      printf("%lld %d AVE %s:  bits_MAX %llu\n", v48, 216, v49, v50);
      __uint64_t v51 = sub_DDEFC();
      v80 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s:  bits_MAX %llu", v51, 216, v80, *(void *)(a1 + 25552));
    }
    else
    {
      syslog(3, "%lld %d AVE %s:  bits_MAX %llu", v48, 216, v49, v50);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v52 = sub_D1C7C(0xD8u);
    __uint64_t v53 = sub_DDEFC();
    v54 = (const char *)sub_D1CB0(7);
    int v55 = v2[16];
    if (v52)
    {
      printf("%lld %d AVE %s:  cnt_BLANK %u\n", v53, 216, v54, v55);
      __uint64_t v56 = sub_DDEFC();
      v81 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s:  cnt_BLANK %u", v56, 216, v81, v2[16]);
    }
    else
    {
      syslog(3, "%lld %d AVE %s:  cnt_BLANK %u", v53, 216, v54, v55);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v57 = sub_D1C7C(0xD8u);
    __uint64_t v58 = sub_DDEFC();
    v59 = (const char *)sub_D1CB0(7);
    uint64_t v60 = *(void *)(v2 + 17);
    if (v57)
    {
      printf("%lld %d AVE %s:  bits_BLANK %llu\n", v58, 216, v59, v60);
      __uint64_t v61 = sub_DDEFC();
      v82 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s:  bits_BLANK %llu", v61, 216, v82, *(void *)(v2 + 17));
    }
    else
    {
      syslog(3, "%lld %d AVE %s:  bits_BLANK %llu", v58, 216, v59, v60);
    }
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v62 = sub_D1C7C(0xD8u);
    __uint64_t v63 = sub_DDEFC();
    v64 = (const char *)sub_D1CB0(7);
    if (v62)
    {
      printf("%lld %d AVE %s:  avg_qscale %f\n", v63, 216, v64, *((float *)v2 + 19));
      __uint64_t v63 = sub_DDEFC();
      v64 = (const char *)sub_D1CB0(7);
    }
    syslog(3, "%lld %d AVE %s:  avg_qscale %f", v63, 216, v64, *((float *)v2 + 19));
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v65 = sub_D1C7C(0xD8u);
    __uint64_t v66 = sub_DDEFC();
    v67 = (const char *)sub_D1CB0(7);
    if (v65)
    {
      printf("%lld %d AVE %s:  current_complexity %lf\n", v66, 216, v67, *(double *)(a1 + 25584));
      __uint64_t v66 = sub_DDEFC();
      v67 = (const char *)sub_D1CB0(7);
    }
    syslog(3, "%lld %d AVE %s:  current_complexity %lf", v66, 216, v67, *(double *)(a1 + 25584));
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v68 = sub_D1C7C(0xD8u);
    __uint64_t v69 = sub_DDEFC();
    v70 = (const char *)sub_D1CB0(7);
    if (v68)
    {
      printf("%lld %d AVE %s:  totalcplxsum %lf\n", v69, 216, v70, *(double *)(a1 + 25592));
      __uint64_t v69 = sub_DDEFC();
      v70 = (const char *)sub_D1CB0(7);
    }
    syslog(3, "%lld %d AVE %s:  totalcplxsum %lf", v69, 216, v70, *(double *)(a1 + 25592));
  }
}

_DWORD *sub_D3A44(void *a1, _DWORD *a2)
{
  __uint64_t v61 = a2;
  if (sub_D1C38(0xD8u, 7))
  {
    int v4 = sub_D1C7C(0xD8u);
    __uint64_t v5 = sub_DDEFC();
    __uint64_t v6 = (const char *)sub_D1CB0(7);
    if (v4)
    {
      if (a2) {
        int v7 = a2[11];
      }
      else {
        int v7 = -1;
      }
      printf("%lld %d AVE %s: MP: scene_change_pipeline() Entry stats %p display_order %d\n", v5, 216, v6, a2, v7);
      __uint64_t v5 = sub_DDEFC();
      __uint64_t v6 = (const char *)sub_D1CB0(7);
      if (a2) {
        goto LABEL_9;
      }
    }
    else if (a2)
    {
LABEL_9:
      int v8 = a2[11];
      goto LABEL_10;
    }
    int v8 = -1;
LABEL_10:
    syslog(3, "%lld %d AVE %s: MP: scene_change_pipeline() Entry stats %p display_order %d", v5, 216, v6, a2, v8);
  }
  if (!a1[3186])
  {
    unsigned int v9 = v61;
    v61[300] = 1;
    a1[3186] = v9;
    sub_D4078(a1 + 3179, a1 + 3186);
  }
  sub_D4078(a1 + 3173, &v61);
  unint64_t v11 = a1[3178];
  int v12 = (float *)v61;
  if (v11 <= 1)
  {
    *((void *)v61 + 151) = 0;
LABEL_33:
    __uint64_t v61 = 0;
    goto LABEL_34;
  }
  unint64_t v13 = v11 - 2;
  unint64_t v14 = a1[3177];
  unint64_t v15 = v14 + v11 - 2;
  uint64_t v16 = a1[3174];
  unint64_t v17 = v15 >> 9;
  uint64_t v18 = *(void *)(v16 + 8 * (v15 >> 9));
  uint64_t v19 = v15 & 0x1FF;
  uint64_t v20 = *(void *)(v18 + 8 * v19);
  if (v61[11] == -1)
  {
    float v23 = *(float *)(v20 + 1208);
  }
  else
  {
    float v21 = *((float *)v61 + 304) + *(float *)(v20 + 1216);
    if (v21 >= 1.0) {
      float v22 = v21 * 0.0019531;
    }
    else {
      float v22 = 0.0019531;
    }
    float v23 = fmaxf(sub_D2B94(v10, (uint64_t)(v61 + 40), v20 + 160) / v22, 0.01);
    unint64_t v14 = a1[3177];
    uint64_t v16 = a1[3174];
    int v12 = (float *)v61;
    unint64_t v17 = (v14 + v13) >> 9;
    uint64_t v19 = (v14 + v13) & 0x1FF;
  }
  float v24 = *(float *)(*(void *)(*(void *)(v16 + 8 * v17) + 8 * v19) + 1208);
  if (v23 >= v24) {
    float v24 = v23;
  }
  v12[302] = v23;
  v12[303] = v24;
  if (v11 < 4)
  {
    if (v11 == 2)
    {
      uint64_t v34 = *(void *)(*(void *)(v16 + ((v14 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v14 & 0x1FF));
      *(void *)(v34 + 1208) = *(void *)(*(void *)(*(void *)(v16 + (((v14 + 1) >> 6) & 0x3FFFFFFFFFFFFF8))
                                                      + 8 * ((v14 + 1) & 0x1FF))
                                          + 1208);
      sub_D2E00((uint64_t)a1, v34);
    }
    goto LABEL_33;
  }
  unint64_t v25 = v11 + v14;
  uint64_t v26 = *(void *)(*(void *)(v16 + (((v25 - 3) >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * ((v25 - 3) & 0x1FF));
  uint64_t v60 = v26;
  float v27 = *(float *)(*(void *)(*(void *)(v16 + (((v25 - 4) >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * ((v25 - 4) & 0x1FF))
                 + 1212);
  float v28 = *(float *)(v26 + 1208);
  float v29 = *(float *)(*(void *)(*(void *)(v16 + (((v25 - 1) >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * ((v25 - 1) & 0x1FF))
                 + 1212);
  float v30 = v28 / v27;
  float v31 = v29 / v28;
  float v32 = (float)(v29 / v28) / (float)(v28 / v27);
  if (*((_DWORD *)v12 + 11) == -1 || *(_DWORD *)(v26 + 44) < 3u)
  {
    *(_DWORD *)(v26 + 1200) = *(_DWORD *)(v26 + 80) & 1;
    sub_D2E00((uint64_t)a1, v26);
    *(_DWORD *)(v26 + 1200) |= *(_DWORD *)(v26 + 44) == -1;
  }
  else
  {
    float v33 = *(float *)(v26 + 36);
    *(_DWORD *)(v26 + 1200) = 0;
    if ((*(unsigned char *)(v26 + 80) & 1) != 0
      || sub_D2CB8(v28, (float)(v29 / v28) / (float)(v28 / v27), v28 / v27, v29 / v28)
      || *(_DWORD *)(a1[3186] + 1220) >= ((float)(v33 * 6.0) + 0.5))
    {
      *(_DWORD *)(v26 + 1200) = 1;
    }
    sub_D2E00((uint64_t)a1, v26);
  }
  if (sub_D1C38(0xD8u, 7))
  {
    int v40 = sub_D1C7C(0xD8u);
    __uint64_t v41 = sub_DDEFC();
    int v42 = (const char *)sub_D1CB0(7);
    int v43 = *(_DWORD *)(v26 + 44);
    int v44 = *(_DWORD *)(v26 + 1200);
    if (v40)
    {
      printf("%lld %d AVE %s: MP: scene_change_pipeline() display_order %d forceKeyFrame %d scene_change %d\n", v41, 216, v42, v43, *(_DWORD *)(v26 + 80) & 1, v44);
      __uint64_t v45 = sub_DDEFC();
      __uint64_t v46 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: MP: scene_change_pipeline() display_order %d forceKeyFrame %d scene_change %d", v45, 216, v46, *(_DWORD *)(v26 + 44), *(_DWORD *)(v26 + 80) & 1, *(_DWORD *)(v26 + 1200));
    }
    else
    {
      syslog(3, "%lld %d AVE %s: MP: scene_change_pipeline() display_order %d forceKeyFrame %d scene_change %d", v41, 216, v42, v43, *(_DWORD *)(v26 + 80) & 1, v44);
    }
  }
  int v47 = (int64x2_t *)(a1 + 3177);
  if (sub_D1C38(0xD8u, 7))
  {
    int v48 = sub_D1C7C(0xD8u);
    __uint64_t v49 = sub_DDEFC();
    uint64_t v50 = (const char *)sub_D1CB0(7);
    double v51 = v27;
    double v52 = v28;
    double v53 = v29;
    double v54 = v32;
    double v55 = v30;
    double v56 = v31;
    if (v48)
    {
      printf("%lld %d AVE %s: MP: scene_change_pipeline() m0 %f m1 %f m2 %f m0m2 %f mdpa_ratio_p %f mdpa_ratio_n %f\n", v49, 216, v50, v51, v52, v53, v54, v55, v56);
      sub_DDEFC();
      sub_D1CB0(7);
    }
    syslog(3, "%lld %d AVE %s: MP: scene_change_pipeline() m0 %f m1 %f m2 %f m0m2 %f mdpa_ratio_p %f mdpa_ratio_n %f");
  }
  if (*(_DWORD *)(v26 + 1200))
  {
    sub_D4078(a1 + 3179, &v60);
    a1[3186] = v60;
  }
  int64x2_t v57 = vaddq_s64(*v47, (int64x2_t)xmmword_14FCE0);
  __uint64_t v61 = *(_DWORD **)(*(void *)(a1[3174] + (((unint64_t)v47->i64[0] >> 6) & 0x3FFFFFFFFFFFFF8))
                   + 8 * (v47->i64[0] & 0x1FF));
  int64x2_t *v47 = v57;
  sub_D6044((uint64_t)(a1 + 3173), 1);
  if (v61[300])
  {
    __uint64_t v61 = 0;
    unint64_t v58 = a1[3183];
    if (*(void *)(*(void *)(a1[3180] + ((v58 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v58 & 0x1FF)) != a1[3186])
    {
      __uint64_t v61 = *(_DWORD **)(*(void *)(a1[3180] + ((a1[3183] >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (a1[3183] & 0x1FFLL));
      --a1[3184];
      a1[3183] = v58 + 1;
      sub_D6044((uint64_t)(a1 + 3179), 1);
    }
  }
LABEL_34:
  if (sub_D1C38(0xD8u, 7))
  {
    int v35 = sub_D1C7C(0xD8u);
    __uint64_t v36 = sub_DDEFC();
    int v37 = (const char *)sub_D1CB0(7);
    if (v35)
    {
      printf("%lld %d AVE %s: MP: scene_change_pipeline() returns stats %p\n", v36, 216, v37, v61);
      __uint64_t v38 = sub_DDEFC();
      v59 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: MP: scene_change_pipeline() returns stats %p", v38, 216, v59, v61);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: MP: scene_change_pipeline() returns stats %p", v36, 216, v37, v61);
    }
  }
  return v61;
}

void sub_D4078(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 6) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    sub_D5854(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }
  *(void *)(*(void *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

void sub_D4100(uint64_t a1, uint64_t a2, int a3)
{
  if (a2)
  {
    if (sub_D1C38(0xD8u, 7))
    {
      int v5 = sub_D1C7C(0xD8u);
      __uint64_t v6 = sub_DDEFC();
      uint64_t v7 = (const char *)sub_D1CB0(7);
      int v8 = *(_DWORD *)(a2 + 44);
      if (v5)
      {
        printf("%lld %d AVE %s: MP: F %d frame_bits %u correction_bits %d\n", v6, 216, v7, v8, *(_DWORD *)(a2 + 64), a3);
        __uint64_t v9 = sub_DDEFC();
        uint64_t v10 = (const char *)sub_D1CB0(7);
        syslog(3, "%lld %d AVE %s: MP: F %d frame_bits %u correction_bits %d", v9, 216, v10, *(_DWORD *)(a2 + 44), *(_DWORD *)(a2 + 64), a3);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: MP: F %d frame_bits %u correction_bits %d", v6, 216, v7, v8, *(_DWORD *)(a2 + 64), a3);
      }
    }
    if (a3)
    {
      uint64_t v11 = *(int *)(a2 + 64);
      if ((int)v11 + a3 >= 1)
      {
        uint64_t v12 = *(unsigned int *)(a2 + 68) * (uint64_t)a3 / v11;
        if (sub_D1C38(0xD8u, 7))
        {
          int v13 = sub_D1C7C(0xD8u);
          __uint64_t v14 = sub_DDEFC();
          unint64_t v15 = (const char *)sub_D1CB0(7);
          int v16 = *(_DWORD *)(a2 + 44);
          if (v13)
          {
            printf("%lld %d AVE %s: MP: F %d hdr_bits %u hdr_correction %d\n", v14, 216, v15, v16, *(_DWORD *)(a2 + 68), v12);
            __uint64_t v17 = sub_DDEFC();
            uint64_t v18 = (const char *)sub_D1CB0(7);
            syslog(3, "%lld %d AVE %s: MP: F %d hdr_bits %u hdr_correction %d", v17, 216, v18, *(_DWORD *)(a2 + 44), *(_DWORD *)(a2 + 68), v12);
          }
          else
          {
            syslog(3, "%lld %d AVE %s: MP: F %d hdr_bits %u hdr_correction %d", v14, 216, v15, v16, *(_DWORD *)(a2 + 68), v12);
          }
        }
        int v19 = *(_DWORD *)(a2 + 68);
        int v20 = *(_DWORD *)(a2 + 64) + a3;
        *(void *)(a2 + 1228) += a3;
        *(void *)(a2 + 1244) += (int)v12;
        *(_DWORD *)(a2 + 64) = v20;
        *(_DWORD *)(a2 + 68) = v19 + v12;
        int v21 = *(_DWORD *)(a2 + 52);
        if (v21)
        {
          if (v21 != 2)
          {
LABEL_17:
            uint64_t v23 = *(void *)(a2 + 1316);
            if (v23) {
              *(void *)(a2 + 1316) = v23 + a3;
            }
            uint64_t v24 = *(void *)(a2 + 1324);
            if (v24) {
              *(void *)(a2 + 1324) = v24 + a3;
            }
            uint64_t v25 = *(void *)(a2 + 1332);
            if (v25) {
              *(void *)(a2 + 1332) = v25 + a3;
            }
            uint64_t v26 = *(void *)(a2 + 1340);
            if (v26) {
              *(void *)(a2 + 1340) = v26 + a3;
            }
            return;
          }
          float v22 = (void *)(a2 + 1252);
        }
        else
        {
          float v22 = (void *)(a2 + 1260);
        }
        *v22 += (int)v12;
        goto LABEL_17;
      }
    }
  }
}

const void *sub_D4358(void *a1, uint64_t a2, int a3)
{
  __uint64_t v6 = (int *)(a1 + 3165);
  BOOL v7 = sub_D1C38(0xD8u, 7);
  if (v7)
  {
    int v8 = sub_D1C7C(0xD8u);
    __uint64_t v9 = sub_DDEFC();
    uint64_t v10 = (const char *)sub_D1CB0(7);
    if (v8)
    {
      if (a2) {
        int v11 = *(_DWORD *)(a2 + 44);
      }
      else {
        int v11 = -1;
      }
      printf("%lld %d AVE %s: MP: enqueue_first_pass() display_order %d flush %d fixup_fifo_len %d\n", v9, 216, v10, v11, a3, v6[6]);
      __uint64_t v9 = sub_DDEFC();
      uint64_t v10 = (const char *)sub_D1CB0(7);
      if (a2) {
        int v12 = *(_DWORD *)(a2 + 44);
      }
      else {
        int v12 = -1;
      }
    }
    else if (a2)
    {
      int v12 = *(_DWORD *)(a2 + 44);
    }
    else
    {
      int v12 = -1;
    }
    syslog(3, "%lld %d AVE %s: MP: enqueue_first_pass() display_order %d flush %d fixup_fifo_len %d", v9, 216, v10, v12, a3, v6[6]);
  }
  unsigned int v13 = v6[6];
  if ((a3 & 1) == 0)
  {
    if (v13 != 2)
    {
      if (v13 == 1)
      {
        __uint64_t v17 = 0;
        a1[(v6[7] == 0) + 3166] = a2;
        int v18 = 2;
      }
      else
      {
        if (v13) {
          goto LABEL_81;
        }
        __uint64_t v17 = 0;
        a1[v6[7] + 3166] = a2;
        int v18 = 1;
      }
      v6[6] = v18;
      goto LABEL_95;
    }
LABEL_23:
    sub_D4100(v7, a1[v6[7] + 3166], *(_DWORD *)(a2 + 72));
    int v19 = &a1[v6[7] + 3166];
    int v20 = (void *)a1[3170];
    unint64_t v21 = a1[3171];
    if ((unint64_t)v20 >= v21)
    {
      uint64_t v27 = a1[3169];
      uint64_t v28 = ((uint64_t)v20 - v27) >> 3;
      if ((unint64_t)(v28 + 1) >> 61) {
        sub_D60A4();
      }
      uint64_t v29 = v21 - v27;
      uint64_t v30 = v29 >> 2;
      if (v29 >> 2 <= (unint64_t)(v28 + 1)) {
        uint64_t v30 = v28 + 1;
      }
      if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v31 = v30;
      }
      if (v31) {
        float v32 = (char *)sub_D600C((uint64_t)(a1 + 3171), v31);
      }
      else {
        float v32 = 0;
      }
      __uint64_t v45 = &v32[8 * v28];
      __uint64_t v46 = &v32[8 * v31];
      *(void *)__uint64_t v45 = *v19;
      uint64_t v22 = (uint64_t)(v45 + 8);
      int v47 = (char *)a1[3170];
      int v48 = (char *)a1[3169];
      if (v47 != v48)
      {
        do
        {
          uint64_t v49 = *((void *)v47 - 1);
          v47 -= 8;
          *((void *)v45 - 1) = v49;
          v45 -= 8;
        }
        while (v47 != v48);
        int v47 = (char *)a1[3169];
      }
      a1[3169] = v45;
      a1[3170] = v22;
      a1[3171] = v46;
      if (v47) {
        operator delete(v47);
      }
    }
    else
    {
      void *v20 = *v19;
      uint64_t v22 = (uint64_t)(v20 + 1);
    }
    a1[3170] = v22;
    sub_D614C(a1[3169], v22, (uint64_t)&v83, (v22 - a1[3169]) >> 3);
    BOOL v50 = v6[7] == 0;
    if (a3) {
      --v6[6];
    }
    else {
      a1[v6[7] + 3166] = a2;
    }
    v6[7] = v50;
    goto LABEL_81;
  }
  if (v13 == 2) {
    goto LABEL_23;
  }
  if (v13 == 1)
  {
    uint64_t v23 = &a1[v6[7] + 3166];
    uint64_t v24 = (void *)a1[3170];
    unint64_t v25 = a1[3171];
    if ((unint64_t)v24 >= v25)
    {
      uint64_t v33 = a1[3169];
      uint64_t v34 = ((uint64_t)v24 - v33) >> 3;
      if ((unint64_t)(v34 + 1) >> 61) {
        goto LABEL_101;
      }
      uint64_t v35 = v25 - v33;
      uint64_t v36 = v35 >> 2;
      if (v35 >> 2 <= (unint64_t)(v34 + 1)) {
        uint64_t v36 = v34 + 1;
      }
      if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v37 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v37 = v36;
      }
      if (v37) {
        __uint64_t v38 = (char *)sub_D600C((uint64_t)(a1 + 3171), v37);
      }
      else {
        __uint64_t v38 = 0;
      }
      double v51 = &v38[8 * v34];
      double v52 = &v38[8 * v37];
      *(void *)double v51 = *v23;
      uint64_t v26 = (uint64_t)(v51 + 8);
      double v53 = (char *)a1[3170];
      double v54 = (char *)a1[3169];
      if (v53 != v54)
      {
        do
        {
          uint64_t v55 = *((void *)v53 - 1);
          v53 -= 8;
          *((void *)v51 - 1) = v55;
          v51 -= 8;
        }
        while (v53 != v54);
        double v53 = (char *)a1[3169];
      }
      a1[3169] = v51;
      a1[3170] = v26;
      a1[3171] = v52;
      if (v53) {
        operator delete(v53);
      }
    }
    else
    {
      *uint64_t v24 = *v23;
      uint64_t v26 = (uint64_t)(v24 + 1);
    }
    a1[3170] = v26;
    sub_D614C(a1[3169], v26, (uint64_t)&v82, (v26 - a1[3169]) >> 3);
    BOOL v56 = v6[7] == 0;
    --v6[6];
    v6[7] = v56;
    if (a2)
    {
      uint64_t v57 = *v6;
      a1[v57 + 3149] = a2;
      if (v57 < 0x10) {
        int v58 = v57 + 1;
      }
      else {
        int v58 = 16;
      }
      *__uint64_t v6 = v58;
    }
    goto LABEL_81;
  }
  if (v13) {
    goto LABEL_81;
  }
  __uint64_t v14 = (void *)a1[3170];
  unint64_t v15 = a1[3171];
  if ((unint64_t)v14 >= v15)
  {
    uint64_t v39 = a1[3169];
    uint64_t v40 = ((uint64_t)v14 - v39) >> 3;
    if (!((unint64_t)(v40 + 1) >> 61))
    {
      uint64_t v41 = v15 - v39;
      uint64_t v42 = v41 >> 2;
      if (v41 >> 2 <= (unint64_t)(v40 + 1)) {
        uint64_t v42 = v40 + 1;
      }
      if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v43 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v43 = v42;
      }
      if (v43) {
        int v44 = (char *)sub_D600C((uint64_t)(a1 + 3171), v43);
      }
      else {
        int v44 = 0;
      }
      v59 = &v44[8 * v40];
      uint64_t v60 = &v44[8 * v43];
      *(void *)v59 = a2;
      uint64_t v16 = (uint64_t)(v59 + 8);
      __uint64_t v61 = (char *)a1[3170];
      int v62 = (char *)a1[3169];
      if (v61 != v62)
      {
        do
        {
          uint64_t v63 = *((void *)v61 - 1);
          v61 -= 8;
          *((void *)v59 - 1) = v63;
          v59 -= 8;
        }
        while (v61 != v62);
        __uint64_t v61 = (char *)a1[3169];
      }
      a1[3169] = v59;
      a1[3170] = v16;
      a1[3171] = v60;
      if (v61) {
        operator delete(v61);
      }
      goto LABEL_80;
    }
LABEL_101:
    sub_D60A4();
  }
  void *v14 = a2;
  uint64_t v16 = (uint64_t)(v14 + 1);
LABEL_80:
  a1[3170] = v16;
  sub_D614C(a1[3169], v16, (uint64_t)&v81, (v16 - a1[3169]) >> 3);
LABEL_81:
  v64 = (void *)a1[3169];
  int v65 = (_DWORD *)*v64;
  int v66 = *(_DWORD *)(*v64 + 44);
  unsigned int v67 = v6[40];
  if (v66 == -1 || v66 == v67)
  {
    v6[40] = v67 + 1;
    uint64_t v69 = a1[3170];
    if (v69 - (uint64_t)v64 >= 9)
    {
      v70 = sub_D61A8(v64, (uint64_t)&v84, (unint64_t)(v69 - (void)v64) >> 3);
      v71 = (void *)(v69 - 8);
      if ((void *)(v69 - 8) == v70)
      {
        void *v70 = v65;
      }
      else
      {
        void *v70 = *v71;
        void *v71 = v65;
        sub_D614C((uint64_t)v64, (uint64_t)(v70 + 1), (uint64_t)&v84, v70 + 1 - v64);
      }
    }
    a1[3170] -= 8;
    v72 = sub_D3A44(a1, v65);
    __uint64_t v17 = v72;
    if (v72)
    {
      uint64_t v73 = *v6;
      a1[v73 + 3149] = v72;
      if (v73 < 0x10) {
        int v74 = v73 + 1;
      }
      else {
        int v74 = 16;
      }
      *__uint64_t v6 = v74;
    }
  }
  else
  {
    __uint64_t v17 = 0;
  }
LABEL_95:
  if (sub_D1C38(0xD8u, 7))
  {
    int v75 = sub_D1C7C(0xD8u);
    __uint64_t v76 = sub_DDEFC();
    v77 = (const char *)sub_D1CB0(7);
    if (v75)
    {
      printf("%lld %d AVE %s: MP: enqueue_first_pass() returns stats %p\n", v76, 216, v77, v17);
      __uint64_t v78 = sub_DDEFC();
      v80 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: MP: enqueue_first_pass() returns stats %p", v78, 216, v80, v17);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: MP: enqueue_first_pass() returns stats %p", v76, 216, v77, v17);
    }
  }
  return v17;
}

void sub_D495C(uint64_t a1)
{
  uint64_t v2 = (_DWORD *)(a1 + 25728);
  if (sub_D1C38(0xD8u, 7))
  {
    int v3 = sub_D1C7C(0xD8u);
    __uint64_t v4 = sub_DDEFC();
    int v5 = (const char *)sub_D1CB0(7);
    if (v3)
    {
      printf("%lld %d AVE %s: MP: FinalizeSeqRcInfo()\n", v4, 216, v5);
      __uint64_t v6 = sub_DDEFC();
      v72 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: MP: FinalizeSeqRcInfo()", v6, 216, v72);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: MP: FinalizeSeqRcInfo()", v4, 216, v5);
    }
  }
  uint64_t v73 = v2;
  BOOL v7 = 0;
  uint64_t v8 = 0;
  v86 = 0;
  v87 = 0;
  v88[0] = 0;
  float v9 = 0.0;
  float v10 = 0.1875;
  do
  {
    uint64_t v11 = a1 + 4 * v8;
    unsigned int v12 = *(_DWORD *)(v11 + 25600);
    if (v12)
    {
      float v13 = *(float *)(v11 + 25664) / (float)v12;
      if ((unint64_t)v7 >= v88[0])
      {
        __uint64_t v14 = (__n128 *)v86;
        uint64_t v15 = ((char *)v7 - (char *)v86) >> 4;
        unint64_t v16 = v15 + 1;
        if ((unint64_t)(v15 + 1) >> 60) {
          sub_D60A4();
        }
        uint64_t v17 = v88[0] - (void)v86;
        if ((uint64_t)(v88[0] - (void)v86) >> 3 > v16) {
          unint64_t v16 = v17 >> 3;
        }
        if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v18 = v16;
        }
        if (v18)
        {
          int v19 = (char *)sub_D6218((uint64_t)v88, v18);
          __uint64_t v14 = (__n128 *)v86;
          BOOL v7 = (__n128 *)v87;
        }
        else
        {
          int v19 = 0;
        }
        int v20 = (__n128 *)&v19[16 * v15];
        v20->n128_u32[0] = v12;
        v20->n128_f32[1] = v13;
        v20->n128_f32[2] = v9;
        v20->n128_f32[3] = v10;
        unint64_t v21 = v20;
        if (v7 != v14)
        {
          do
          {
            v21[-1] = v7[-1];
            --v21;
            --v7;
          }
          while (v7 != v14);
          __uint64_t v14 = (__n128 *)v86;
        }
        BOOL v7 = v20 + 1;
        v86 = (float *)v21;
        v87 = (float *)&v20[1];
        v88[0] = &v19[16 * v18];
        if (v14) {
          operator delete(v14);
        }
      }
      else
      {
        v7->n128_u32[0] = v12;
        v7->n128_f32[1] = v13;
        v7->n128_f32[2] = v9;
        v7->n128_f32[3] = v10;
        ++v7;
      }
      v87 = (float *)v7;
    }
    float v9 = v10;
    float v10 = v10 + 0.1875;
    ++v8;
  }
  while (v8 != 16);
  uint64_t v22 = (__n128 *)v86;
  if (v86 == (float *)v7)
  {
    uint64_t v23 = v73;
    if ((unint64_t)v7 >= v88[0])
    {
      unint64_t v24 = (uint64_t)(v88[0] - (void)v7) >> 3;
      if (v24 <= 1) {
        unint64_t v24 = 1;
      }
      if (v88[0] - (void)v7 >= 0x7FFFFFFFFFFFFFF0uLL) {
        unint64_t v25 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v25 = v24;
      }
      uint64_t v26 = (char *)sub_D6218((uint64_t)v88, v25);
      uint64_t v27 = v86;
      uint64_t v28 = v87;
      uint64_t v30 = &v26[16 * v29];
      *(_DWORD *)uint64_t v26 = 1;
      *(void *)(v26 + 4) = 1069547520;
      *((_DWORD *)v26 + 3) = 1077936128;
      BOOL v7 = (__n128 *)(v26 + 16);
      if (v28 != v27)
      {
        do
        {
          *((_OWORD *)v26 - 1) = *((_OWORD *)v28 - 1);
          v26 -= 16;
          v28 -= 4;
        }
        while (v28 != v27);
        uint64_t v27 = v86;
      }
      v86 = (float *)v26;
      v87 = (float *)v7;
      v88[0] = v30;
      if (v27) {
        operator delete(v27);
      }
    }
    else
    {
      v7->n128_u32[0] = 1;
      *(unint64_t *)((char *)v7->n128_u64 + 4) = 1069547520;
      v7->n128_u32[3] = 1077936128;
      ++v7;
    }
    v87 = (float *)v7;
    uint64_t v22 = (__n128 *)v86;
  }
  else
  {
    uint64_t v23 = v73;
  }
  unint64_t v31 = v7 - v22;
  if ((unint64_t)((char *)v7 - (char *)v22) <= 0x3F)
  {
    do
    {
      unint64_t v32 = 126 - 2 * __clz(v31);
      if (v7 == v22) {
        uint64_t v33 = 0;
      }
      else {
        uint64_t v33 = v32;
      }
      sub_D6250((unsigned int *)v22, (long long *)v7, (uint64_t)&v83, v33, 1);
      uint64_t v34 = v86;
      float v35 = v86[1];
      float v36 = v86[2];
      float v37 = (float)(v36 + v35) * 0.5;
      float v38 = *v86;
      unsigned __int32 v39 = *(_DWORD *)v86 >> 1;
      v86[1] = (float)(v35 + v86[3]) * 0.5;
      v34[2] = v35;
      *(_DWORD *)uint64_t v34 = LODWORD(v38) - (LODWORD(v38) >> 1);
      uint64_t v40 = v87;
      if ((unint64_t)v87 >= v88[0])
      {
        uint64_t v41 = ((char *)v87 - (char *)v34) >> 4;
        if ((unint64_t)(v41 + 1) >> 60) {
          sub_D60A4();
        }
        uint64_t v42 = v88[0] - (void)v34;
        uint64_t v43 = v42 >> 3;
        if (v42 >> 3 <= (unint64_t)(v41 + 1)) {
          uint64_t v43 = v41 + 1;
        }
        if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v44 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v44 = v43;
        }
        if (v44)
        {
          __uint64_t v45 = (char *)sub_D6218((uint64_t)v88, v44);
          uint64_t v40 = v87;
        }
        else
        {
          __uint64_t v45 = 0;
        }
        __uint64_t v46 = (__n128 *)&v45[16 * v41];
        v46->n128_u32[0] = v39;
        v46->n128_f32[1] = v37;
        v46->n128_f32[2] = v36;
        v46->n128_f32[3] = v35;
        int v47 = v86;
        int v48 = v46;
        if (v40 != v86)
        {
          do
          {
            v48[-1] = *(__n128 *)(v40 - 4);
            --v48;
            v40 -= 4;
          }
          while (v40 != v47);
          uint64_t v40 = v86;
        }
        BOOL v7 = v46 + 1;
        v86 = (float *)v48;
        v87 = (float *)&v46[1];
        v88[0] = &v45[16 * v44];
        if (v40) {
          operator delete(v40);
        }
      }
      else
      {
        *(_DWORD *)v87 = v39;
        v40[1] = v37;
        v40[2] = v36;
        BOOL v7 = (__n128 *)(v40 + 4);
        v40[3] = v35;
      }
      v87 = (float *)v7;
      uint64_t v22 = (__n128 *)v86;
      unint64_t v31 = ((char *)v7 - (char *)v86) >> 4;
    }
    while ((unint64_t)((char *)v7 - (char *)v86) < 0x40);
  }
  unint64_t v49 = 126 - 2 * __clz(v31);
  if (v7 == v22) {
    uint64_t v50 = 0;
  }
  else {
    uint64_t v50 = v49;
  }
  sub_D6EF0(v22, (long long *)v7, (uint64_t)&v83, v50, 1);
  char v83 = 0;
  char v84 = 0;
  uint64_t v85 = 0;
  float v51 = *(v87 - 1);
  float v52 = v86[2];
  sub_D5174((uint64_t)&v83, 4uLL);
  uint64_t v53 = 0;
  float v54 = (float)(v51 - v52) * 0.25;
  float v55 = v52 + v54;
  float v56 = (float)(v52 + (float)(v52 + v54)) * 0.5;
  do
  {
    uint64_t v57 = (float *)((char *)v83 + v53);
    v57[1] = v56;
    v57[2] = v52;
    v57[3] = v55;
    *uint64_t v57 = 0.0;
    if (sub_D1C38(0x2Eu, 8))
    {
      if (sub_D1C7C(0x2Eu))
      {
        __uint64_t v58 = sub_DDEFC();
        v59 = (const char *)sub_D1CB0(8);
        printf("%lld %d AVE %s: center %f left %f right %f count %u\n", v58, 46, v59, *(float *)((char *)v83 + v53 + 4), *(float *)((char *)v83 + v53 + 8), *(float *)((char *)v83 + v53 + 12), *(_DWORD *)((char *)v83 + v53));
      }
      __uint64_t v60 = sub_DDEFC();
      __uint64_t v61 = (const char *)sub_D1CB0(8);
      syslog(3, "%lld %d AVE %s: center %f left %f right %f count %u", v60, 46, v61, *(float *)((char *)v83 + v53 + 4), *(float *)((char *)v83 + v53 + 8), *(float *)((char *)v83 + v53 + 12), *(_DWORD *)((char *)v83 + v53));
    }
    float v56 = v54 + v56;
    float v52 = v54 + v52;
    float v55 = v54 + v55;
    v53 += 16;
  }
  while (v53 != 64);
  __p = 0;
  char v81 = 0;
  uint64_t v82 = 0;
  int v62 = sub_D7D58(&__p, v86, (uint64_t)v87, ((char *)v87 - (char *)v86) >> 4);
  sub_D51A4((uint64_t)v62, (unint64_t *)&__p, (unint64_t *)&v83);
  if (__p)
  {
    char v81 = __p;
    operator delete(__p);
  }
  v77 = 0;
  __uint64_t v78 = 0;
  uint64_t v79 = 0;
  uint64_t v63 = sub_D7D58(&v77, v86, (uint64_t)v87, ((char *)v87 - (char *)v86) >> 4);
  sub_D51A4((uint64_t)v63, (unint64_t *)&v77, (unint64_t *)&v83);
  if (v77)
  {
    __uint64_t v78 = v77;
    operator delete(v77);
  }
  int v74 = 0;
  int v75 = 0;
  uint64_t v76 = 0;
  v64 = sub_D7D58(&v74, v86, (uint64_t)v87, ((char *)v87 - (char *)v86) >> 4);
  sub_D51A4((uint64_t)v64, (unint64_t *)&v74, (unint64_t *)&v83);
  if (v74)
  {
    int v75 = v74;
    operator delete(v74);
  }
  uint64_t v65 = 0;
  int v66 = (char *)v83;
  unsigned int v67 = v23 + 4;
  do
  {
    *(v67 - 4) = *(_DWORD *)&v66[v65];
    *v67++ = *(_DWORD *)&v66[v65 + 4];
    v65 += 16;
  }
  while (v65 != 64);
  if (sub_D1C38(0x2Eu, 8))
  {
    if (sub_D1C7C(0x2Eu))
    {
      __uint64_t v68 = sub_DDEFC();
      uint64_t v69 = (const char *)sub_D1CB0(8);
      printf("%lld %d AVE %s: log10_cplx quantized histogram : values %f %f %f %f counts %u %u %u %u\n", v68, 46, v69, *((float *)v23 + 4), *((float *)v23 + 5), *((float *)v23 + 6), *((float *)v23 + 7), *v23, v23[1], v23[2], v23[3]);
    }
    __uint64_t v70 = sub_DDEFC();
    v71 = (const char *)sub_D1CB0(8);
    syslog(3, "%lld %d AVE %s: log10_cplx quantized histogram : values %f %f %f %f counts %u %u %u %u", v70, 46, v71, *((float *)v23 + 4), *((float *)v23 + 5), *((float *)v23 + 6), *((float *)v23 + 7), *v23, v23[1], v23[2], v23[3]);
  }
  if (v83)
  {
    char v84 = v83;
    operator delete(v83);
  }
  if (v86)
  {
    v87 = v86;
    operator delete(v86);
  }
}

void sub_D50E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31)
{
  uint64_t v33 = *(void **)(v31 - 144);
  if (v33)
  {
    *(void *)(v31 - 136) = v33;
    operator delete(v33);
  }
  _Unwind_Resume(exception_object);
}

void sub_D5174(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 16 * a2;
    }
  }
  else
  {
    sub_D7C4C((char **)a1, a2 - v2);
  }
}

void sub_D51A4(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  if (sub_D1C38(0xD8u, 7))
  {
    int v5 = sub_D1C7C(0xD8u);
    __uint64_t v6 = sub_DDEFC();
    BOOL v7 = (const char *)sub_D1CB0(7);
    if (v5)
    {
      printf("%lld %d AVE %s: MP: QuantizeData()\n", v6, 216, v7);
      __uint64_t v8 = sub_DDEFC();
      uint64_t v43 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: MP: QuantizeData()", v8, 216, v43);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: MP: QuantizeData()", v6, 216, v7);
    }
  }
  unint64_t v10 = *a3;
  unint64_t v9 = a3[1];
  if (*a3 < v9)
  {
    unint64_t v11 = a2[1];
    float v12 = 0.0;
    do
    {
      unint64_t v13 = *a2;
      if (*a2 >= v11)
      {
        float v15 = 0.0;
        unsigned int v40 = (float)((float)(v12 + 0.0) + 0.5);
        *(_DWORD *)unint64_t v10 = v40;
      }
      else
      {
        float v14 = 0.0;
        float v15 = 0.0;
        do
        {
          if (sub_D1C38(0x2Eu, 8))
          {
            int v16 = sub_D1C7C(0x2Eu);
            __uint64_t v17 = sub_DDEFC();
            unint64_t v18 = (const char *)sub_D1CB0(8);
            double v19 = *(float *)(v13 + 8);
            double v20 = *(float *)(v13 + 4);
            double v21 = *(float *)(v13 + 12);
            double v22 = *(float *)(v10 + 8);
            double v23 = *(float *)(v10 + 4);
            double v24 = *(float *)(v10 + 12);
            if (v16)
            {
              printf("%lld %d AVE %s: it %f %f %f q_it %f %f %f\n", v17, 46, v18, v19, v20, v21, v22, *(float *)(v10 + 4), v24);
              __uint64_t v17 = sub_DDEFC();
              unint64_t v18 = (const char *)sub_D1CB0(8);
              double v19 = *(float *)(v13 + 8);
              double v20 = *(float *)(v13 + 4);
              double v21 = *(float *)(v13 + 12);
              double v22 = *(float *)(v10 + 8);
              double v23 = *(float *)(v10 + 4);
              double v24 = *(float *)(v10 + 12);
            }
            syslog(3, "%lld %d AVE %s: it %f %f %f q_it %f %f %f", v17, 46, v18, v19, v20, v21, v22, v23, v24);
          }
          float v25 = *(float *)(v13 + 12);
          float v26 = *(float *)(v10 + 8);
          if (v25 > v26)
          {
            float v27 = *(float *)(v13 + 8);
            float v28 = *(float *)(v10 + 12);
            if (v27 < v28)
            {
              float v29 = v27 >= v26 ? *(float *)(v13 + 8) : *(float *)(v10 + 8);
              float v30 = v28 >= v25 ? *(float *)(v13 + 12) : *(float *)(v10 + 12);
              float v31 = (float)((float)(v30 - v29) * (float)*(unsigned int *)v13) / (float)(v25 - v27);
              float v32 = (float)(v29 + v30) * 0.5;
              float v15 = v15 + v31;
              float v14 = v14 + (float)(v31 * v32);
              if (sub_D1C38(0x2Eu, 8))
              {
                int v33 = sub_D1C7C(0x2Eu);
                __uint64_t v34 = sub_DDEFC();
                float v35 = (const char *)sub_D1CB0(8);
                double v36 = v29;
                double v37 = v30;
                double v38 = v31;
                double v39 = v32;
                if (v33)
                {
                  printf("%lld %d AVE %s: left_overlap %f right_overlap %f l_count %f center %f\n", v34, 46, v35, v36, v37, v38, v39);
                  __uint64_t v34 = sub_DDEFC();
                  float v35 = (const char *)sub_D1CB0(8);
                }
                syslog(3, "%lld %d AVE %s: left_overlap %f right_overlap %f l_count %f center %f", v34, 46, v35, v36, v37, v38, v39);
              }
            }
          }
          v13 += 16;
          unint64_t v11 = a2[1];
        }
        while (v13 < v11);
        unsigned int v40 = (float)((float)(v12 + v15) + 0.5);
        *(_DWORD *)unint64_t v10 = v40;
        if (v15 > 0.0) {
          *(float *)(v10 + 4) = v14 / v15;
        }
      }
      float v12 = v15 - (float)v40;
      v10 += 16;
      unint64_t v9 = a3[1];
    }
    while (v10 < v9);
    unint64_t v10 = *a3;
  }
  if (v10 < v9)
  {
    do
    {
      unint64_t v41 = v10 + 16;
      if (v10 + 16 != v9)
      {
        float v42 = (float)(*(float *)(v10 + 4) + *(float *)(v10 + 20)) * 0.5;
        *(float *)(v10 + 12) = v42;
        *(float *)(v10 + 24) = v42;
      }
      v10 += 16;
    }
    while (v41 < v9);
  }
}

void sub_D5520(void *a1, uint64_t a2, FILE *a3)
{
  if (sub_D1C38(0xD8u, 7))
  {
    int v6 = sub_D1C7C(0xD8u);
    __uint64_t v7 = sub_DDEFC();
    __uint64_t v8 = (const char *)sub_D1CB0(7);
    if (v6)
    {
      printf("%lld %d AVE %s: MP: %s\n", v7, 216, v8, "FlushStats");
      __uint64_t v9 = sub_DDEFC();
      double v23 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: MP: %s", v9, 216, v23, "FlushStats");
    }
    else
    {
      syslog(3, "%lld %d AVE %s: MP: %s", v7, 216, v8, "FlushStats");
    }
  }
  unint64_t v10 = 0;
  while (!v10 || *((_DWORD *)v10 + 11) != -1)
  {
    uint64_t v11 = sub_A9668((uint64_t)a1);
    if (!v11) {
      break;
    }
    *(_DWORD *)(v11 + 44) = -1;
    unint64_t v10 = (const UInt8 *)sub_D4358(a1, v11, 0);
    if (!sub_D1C38(0xD8u, 7)) {
      goto LABEL_19;
    }
    int v12 = sub_D1C7C(0xD8u);
    __uint64_t v13 = sub_DDEFC();
    float v14 = (const char *)sub_D1CB0(7);
    if (v12)
    {
      if (v10) {
        int v15 = *((_DWORD *)v10 + 11);
      }
      else {
        int v15 = -1;
      }
      printf("%lld %d AVE %s: MP: %s flushes stats %p display_order %d\n", v13, 216, v14, "FlushStats", v10, v15);
      __uint64_t v13 = sub_DDEFC();
      float v14 = (const char *)sub_D1CB0(7);
      if (v10)
      {
LABEL_17:
        int v16 = *((_DWORD *)v10 + 11);
        goto LABEL_18;
      }
    }
    else if (v10)
    {
      goto LABEL_17;
    }
    int v16 = -1;
LABEL_18:
    syslog(3, "%lld %d AVE %s: MP: %s flushes stats %p display_order %d", v13, 216, v14, "FlushStats", v10, v16);
LABEL_19:
    if (v10 && *((_DWORD *)v10 + 11) != -1)
    {
      if (a2)
      {
        Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
        CFDataAppendBytes(Mutable, v10, 1574);
        int v18 = VTMultiPassStorageSetDataAtTimeStamp();
        if (Mutable) {
          CFRelease(Mutable);
        }
        if (v18 && sub_D1C38(0x2Eu, 4))
        {
          int v19 = sub_D1C7C(0x2Eu);
          __uint64_t v20 = sub_DDEFC();
          double v21 = (const char *)sub_D1CB0(4);
          if (v19)
          {
            printf("%lld %d AVE %s: MP: %s ERROR: VTMultiPassStorageSetDataAtTimeStamp failed ...\n", v20, 46, v21, "FlushStats");
            __uint64_t v22 = sub_DDEFC();
            double v24 = (const char *)sub_D1CB0(4);
            syslog(3, "%lld %d AVE %s: MP: %s ERROR: VTMultiPassStorageSetDataAtTimeStamp failed ...", v22, 46, v24, "FlushStats");
          }
          else
          {
            syslog(3, "%lld %d AVE %s: MP: %s ERROR: VTMultiPassStorageSetDataAtTimeStamp failed ...", v20, 46, v21, "FlushStats");
          }
        }
      }
      if (a3)
      {
        fseeko(a3, 1574 * *((unsigned int *)v10 + 11) + 264, 0);
        fwrite(v10, 1uLL, 0x626uLL, a3);
      }
    }
  }
  sub_AF04C((unint64_t)a1);
  sub_D495C((uint64_t)a1);
  if (a3)
  {
    fseek(a3, 0, 0);
    fwrite(a1 + 3187, 1uLL, 0x108uLL, a3);
  }
}

void sub_D5854(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    int v6 = (char *)a1[3];
    a1[4] = v4;
    __uint64_t v7 = (void *)a1[1];
    __uint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    __uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)__uint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      __uint64_t v34 = (char *)sub_D600C(v5, v33);
      float v35 = &v34[8 * (v33 >> 2)];
      double v37 = &v34[8 * v36];
      double v38 = (uint64_t *)a1[1];
      __uint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        __uint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        unint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)unint64_t v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    int v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      __uint64_t v9 = (char *)a1[1];
    }
    __uint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      sub_D5B6C(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    sub_D5C84((uint64_t)a1, &v54);
    unint64_t v44 = (void *)a1[1];
    __uint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    __uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      __uint64_t v34 = (char *)sub_D600C((uint64_t)(a1 + 3), v46);
      float v35 = &v34[8 * (v46 >> 2)];
      double v37 = &v34[8 * v47];
      int v48 = (uint64_t *)a1[1];
      __uint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        __uint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        float v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)float v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      uint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        __uint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  float v56 = a1 + 3;
  *(void *)&long long v54 = sub_D600C((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0x1000uLL);
  sub_D5DA4(&v54, &v53);
  float v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_D5EBC((uint64_t)&v54, v27);
  }
  float v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_D5B20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_D5B6C(void *a1, void *a2)
{
  uint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  int v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    __uint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      int v19 = (char *)sub_D600C(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      unint64_t v22 = (uint64_t *)a1[1];
      int v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        int v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      float v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        int v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        int v6 = (char *)a1[1];
      }
      uint64_t v17 = &v6[8 * v13];
      int v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)int v6 = *a2;
  a1[2] += 8;
}

void sub_D5C84(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    __uint64_t v7 = *(unsigned char **)(a1 + 24);
    uint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      uint64_t v14 = (char *)sub_D600C(v6, v12);
      uint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      int64_t v16 = *(uint64_t **)(a1 + 8);
      uint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        uint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      unint64_t v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      uint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_D5DA4(void *a1, void *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      uint64_t v17 = (char *)sub_D600C(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 3;
      BOOL v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

void sub_D5EBC(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    uint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = (v7 - v4) >> 2;
      }
      uint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)sub_D600C(*(void *)(a1 + 32), v11);
      uint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      uint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        uint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      uint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    uint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void sub_D5FD8()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_D600C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_D5FD8();
  }
  return operator new(8 * a2);
}

uint64_t sub_D6044(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x200) {
    a2 = 1;
  }
  if (v2 < 0x400) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 512;
  }
  return v4 ^ 1u;
}

void sub_D60A4()
{
}

void sub_D60BC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_D6118(exception, a1);
}

void sub_D6104(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_D6118(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_D614C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    unint64_t v4 = (unint64_t)(a4 - 2) >> 1;
    uint64_t v5 = (void *)(result + 8 * v4);
    uint64_t v6 = *v5;
    uint64_t v9 = *(void *)(a2 - 8);
    uint64_t v7 = (void *)(a2 - 8);
    uint64_t v8 = v9;
    unsigned int v10 = *(_DWORD *)(v9 + 44);
    if (*(_DWORD *)(*v5 + 44) > v10)
    {
      do
      {
        unint64_t v11 = v5;
        void *v7 = v6;
        if (!v4) {
          break;
        }
        unint64_t v4 = (v4 - 1) >> 1;
        uint64_t v5 = (void *)(result + 8 * v4);
        uint64_t v6 = *v5;
        uint64_t v7 = v11;
      }
      while (*(_DWORD *)(*v5 + 44) > v10);
      *unint64_t v11 = v8;
    }
  }
  return result;
}

void *sub_D61A8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = &a1[v3];
    uint64_t v9 = v6[1];
    uint64_t v7 = v6 + 1;
    uint64_t v8 = v9;
    uint64_t v10 = (2 * v3) | 1;
    uint64_t v11 = 2 * v3 + 2;
    if (v11 < a3 && *(_DWORD *)(v8 + 44) > *(_DWORD *)(v7[1] + 44))
    {
      uint64_t v8 = v7[1];
      ++v7;
      uint64_t v10 = v11;
    }
    *a1 = v8;
    a1 = v7;
    uint64_t v3 = v10;
  }
  while (v10 <= v5);
  return v7;
}

void *sub_D6218(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_D5FD8();
  }
  return operator new(16 * a2);
}

void sub_D6250(unsigned int *a1, long long *a2, uint64_t a3, uint64_t a4, char a5)
{
LABEL_1:
  uint64_t v11 = a1;
LABEL_2:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    a1 = v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = ((char *)a2 - (char *)v11) >> 4;
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          unsigned int v22 = *((_DWORD *)a2 - 4);
          uint64_t v21 = a2 - 1;
          if (v22 > *v11)
          {
            long long v30 = *(_OWORD *)v11;
            *(_OWORD *)uint64_t v11 = *v21;
            long long *v21 = v30;
          }
          break;
        case 3uLL:
          sub_D66CC((long long *)v11, v11 + 4, (unsigned int *)a2 - 4);
          break;
        case 4uLL:
          sub_D6ABC((long long *)v11, v11 + 4, v11 + 8, a2 - 1);
          break;
        case 5uLL:
          sub_D6B60((long long *)v11, v11 + 4, v11 + 8, (__n128 *)v11 + 3, (__n128 *)a2 - 1);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v14 <= 383) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != (unsigned int *)a2)
      {
        sub_D6C30((long long *)v11, a2, a2, a3);
      }
      return;
    }
    unint64_t v16 = v15 >> 1;
    uint64_t v17 = &v11[4 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0x801)
    {
      sub_D66CC((long long *)v11, &v11[4 * (v15 >> 1)], (unsigned int *)a2 - 4);
      sub_D66CC((long long *)v11 + 1, v17 - 4, (unsigned int *)a2 - 8);
      sub_D66CC((long long *)v11 + 2, &v11[4 * v16 + 4], (unsigned int *)a2 - 12);
      sub_D66CC((long long *)v17 - 1, v17, &v11[4 * v16 + 4]);
      long long v29 = *(_OWORD *)v11;
      *(_OWORD *)uint64_t v11 = *(_OWORD *)v17;
      *(_OWORD *)uint64_t v17 = v29;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      sub_D66CC((long long *)&v11[4 * (v15 >> 1)], v11, (unsigned int *)a2 - 4);
      if (a5) {
        goto LABEL_13;
      }
    }
    if (*(v11 - 4) <= *v11)
    {
      uint64_t v11 = sub_D6788(v11, (unsigned int *)a2);
      goto LABEL_18;
    }
LABEL_13:
    uint64_t v18 = sub_D6848((long long *)v11, a2);
    if ((v19 & 1) == 0) {
      goto LABEL_16;
    }
    BOOL v20 = sub_D6910((uint64_t)v11, (__n128 *)v18);
    uint64_t v11 = (unsigned int *)(v18 + 1);
    if (sub_D6910((uint64_t)(v18 + 1), (__n128 *)a2))
    {
      a4 = -v13;
      a2 = v18;
      if (v20) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v12 = v13 + 1;
    if (!v20)
    {
LABEL_16:
      sub_D6250(a1, v18, a3, -v13, a5 & 1);
      uint64_t v11 = (unsigned int *)(v18 + 1);
LABEL_18:
      a5 = 0;
      a4 = -v13;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    sub_D6648(v11, a2);
  }
  else if (v11 != (unsigned int *)a2)
  {
    uint64_t v23 = (long long *)(v11 + 4);
    while (v23 != a2)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *((void *)a1 + 2);
      if (v25 > *a1)
      {
        uint64_t v26 = *((void *)a1 + 3);
        float v27 = v24;
        do
        {
          long long *v27 = *(v27 - 1);
          unsigned int v28 = *((_DWORD *)v27-- - 8);
        }
        while (v25 > v28);
        *(void *)float v27 = v25;
        *((void *)v27 + 1) = v26;
      }
      uint64_t v23 = v24 + 1;
      a1 = (unsigned int *)v24;
    }
  }
}

  uint64_t v11 = (__n128 *)(a2 - 1);
  uint64_t v12 = a1;
LABEL_2:
  uint64_t v13 = 1 - a4;
  while (1)
  {
    a1 = v12;
    uint64_t v14 = v13;
    unint64_t v15 = (char *)a2 - (char *)v12;
    unint64_t v16 = ((char *)a2 - (char *)v12) >> 4;
    if (!(!v6 & v5))
    {
      switch(v16)
      {
        case 0uLL:
        case 1uLL:
          return;
        case 2uLL:
          if (*((float *)a2 - 3) < v12->n128_f32[1])
          {
            uint64_t v23 = *v12;
            *uint64_t v12 = *v11;
            *uint64_t v11 = v23;
          }
          break;
        case 3uLL:
          sub_D73B0((float *)v12, (float *)&v12[1], (float *)a2 - 4);
          break;
        case 4uLL:
          sub_D77F8((float *)v12, (uint64_t)&v12[1], (uint64_t)&v12[2], (uint64_t)(a2 - 1));
          break;
        case 5uLL:
          sub_D789C((float *)v12, v12 + 1, v12 + 2, v12 + 3, (__n128 *)a2 - 1);
          break;
        default:
          JUMPOUT(0);
      }
      return;
    }
    if (v15 <= 383) {
      break;
    }
    if (v14 == 1)
    {
      if (v12 != (__n128 *)a2)
      {
        sub_D796C((uint64_t)v12, a2, a2, a3);
      }
      return;
    }
    uint64_t v17 = v16 >> 1;
    uint64_t v18 = (float *)&v12[v16 >> 1];
    if ((unint64_t)v15 >= 0x801)
    {
      sub_D73B0((float *)v12, (float *)&v12[v16 >> 1], (float *)a2 - 4);
      sub_D73B0((float *)&v12[1], v18 - 4, (float *)a2 - 8);
      sub_D73B0((float *)&v12[2], (float *)&v12[v17 + 1], (float *)a2 - 12);
      sub_D73B0(v18 - 4, v18, (float *)&v12[v17 + 1]);
      unsigned int v22 = *v12;
      *uint64_t v12 = *(__n128 *)v18;
      *(__n128 *)uint64_t v18 = v22;
      if (a5) {
        goto LABEL_13;
      }
    }
    else
    {
      sub_D73B0((float *)&v12[v16 >> 1], (float *)v12, (float *)a2 - 4);
      if (a5) {
        goto LABEL_13;
      }
    }
    if (v12[-1].n128_f32[1] >= v12->n128_f32[1])
    {
      uint64_t v12 = (__n128 *)sub_D746C((float *)v12, (float *)a2);
      goto LABEL_18;
    }
LABEL_13:
    char v19 = (__n128 *)sub_D7554((long long *)v12, (float *)a2);
    if ((v20 & 1) == 0) {
      goto LABEL_16;
    }
    uint64_t v21 = sub_D7640(v12, v19);
    uint64_t v12 = v19 + 1;
    if (sub_D7640(v19 + 1, (__n128 *)a2))
    {
      a4 = -v14;
      a2 = (long long *)v19;
      if (v21) {
        return;
      }
      goto LABEL_1;
    }
    uint64_t v13 = v14 + 1;
    if (!v21)
    {
LABEL_16:
      sub_D6EF0(a1, v19, a3, -v14, a5 & 1);
      uint64_t v12 = v19 + 1;
LABEL_18:
      a5 = 0;
      a4 = -v14;
      goto LABEL_2;
    }
  }
  if (a5)
  {
    sub_D72C0(v12, a2);
  }
  else
  {
    sub_D734C((uint64_t)v12, (uint64_t)a2);
  }
}

void *sub_D6648(void *result, void *a2)
{
  if (result != a2)
  {
    unint64_t v2 = result + 2;
    if (result + 2 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result;
      do
      {
        char v5 = v2;
        uint64_t v6 = v4[2];
        if (v6 > *(_DWORD *)v4)
        {
          uint64_t v7 = v4[3];
          uint64_t v8 = v3;
          while (1)
          {
            *(_OWORD *)((char *)result + v8 + 16) = *(_OWORD *)((char *)result + v8);
            if (!v8) {
              break;
            }
            unsigned int v9 = *(_DWORD *)((char *)result + v8 - 16);
            v8 -= 16;
            if (v6 <= v9)
            {
              uint64_t v10 = (void *)((char *)result + v8 + 16);
              goto LABEL_10;
            }
          }
          uint64_t v10 = result;
LABEL_10:
          void *v10 = v6;
          v10[1] = v7;
        }
        unint64_t v2 = v5 + 2;
        v3 += 16;
        uint64_t v4 = v5;
      }
      while (v5 + 2 != a2);
    }
  }
  return result;
}

uint64_t sub_D66CC(long long *a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int v3 = *a2;
  unsigned int v4 = *a3;
  if (*a2 > *(_DWORD *)a1)
  {
    if (v4 > v3)
    {
      long long v5 = *a1;
      *a1 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v5;
      return 1;
    }
    long long v8 = *a1;
    *a1 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v8;
    if (*a3 <= *a2) {
      return 1;
    }
    long long v9 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v9;
    return 2;
  }
  if (v4 > v3)
  {
    long long v6 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v6;
    if (*a2 <= *(_DWORD *)a1) {
      return 1;
    }
    long long v7 = *a1;
    *a1 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v7;
    return 2;
  }
  return 0;
}

unsigned int *sub_D6788(unsigned int *a1, unsigned int *a2)
{
  long long v2 = *(_OWORD *)a1;
  unsigned int v3 = *(_OWORD *)a1;
  if (v3 <= *(a2 - 4))
  {
    long long v6 = a1 + 4;
    do
    {
      unsigned int v4 = v6;
      if (v6 >= a2) {
        break;
      }
      v6 += 4;
    }
    while (v3 <= *v4);
  }
  else
  {
    unsigned int v4 = a1;
    do
    {
      unsigned int v5 = v4[4];
      v4 += 4;
    }
    while (v3 <= v5);
  }
  if (v4 < a2)
  {
    do
    {
      unsigned int v7 = *(a2 - 4);
      a2 -= 4;
    }
    while (v3 > v7);
  }
  while (v4 < a2)
  {
    long long v11 = *(_OWORD *)v4;
    *(_OWORD *)unsigned int v4 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v11;
    do
    {
      unsigned int v8 = v4[4];
      v4 += 4;
    }
    while (v3 <= v8);
    do
    {
      unsigned int v9 = *(a2 - 4);
      a2 -= 4;
    }
    while (v3 > v9);
  }
  if (v4 - 4 != a1) {
    *(_OWORD *)a1 = *((_OWORD *)v4 - 1);
  }
  *((_OWORD *)v4 - 1) = v2;
  return v4;
}

long long *sub_D6848(long long *a1, long long *a2)
{
  uint64_t v2 = 0;
  long long v3 = *a1;
  unsigned int v4 = *a1;
  do
    unsigned int v5 = a1[++v2];
  while (v4 < v5);
  long long v6 = &a1[v2];
  unsigned int v7 = &a1[v2 - 1];
  if (v2 == 1)
  {
    do
    {
      if (v6 >= a2) {
        break;
      }
      unsigned int v9 = *((_DWORD *)a2-- - 4);
    }
    while (v4 >= v9);
  }
  else
  {
    do
      unsigned int v8 = *((_DWORD *)a2-- - 4);
    while (v4 >= v8);
  }
  if (v6 < a2)
  {
    uint64_t v10 = &a1[v2];
    long long v11 = a2;
    do
    {
      long long v12 = *v10;
      long long *v10 = *v11;
      *long long v11 = v12;
      do
        unsigned int v13 = *((_DWORD *)v10++ + 4);
      while (v4 < v13);
      do
        unsigned int v14 = *((_DWORD *)v11-- - 4);
      while (v4 >= v14);
    }
    while (v10 < v11);
    unsigned int v7 = v10 - 1;
  }
  if (v7 != a1) {
    *a1 = *v7;
  }
  long long *v7 = v3;
  return v7;
}

BOOL sub_D6910(uint64_t a1, __n128 *a2)
{
  uint64_t v4 = ((uint64_t)a2 - a1) >> 4;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      long long v6 = (long long *)&a2[-1];
      if (a2[-1].n128_u32[0] > *(_DWORD *)a1)
      {
        long long v7 = *(_OWORD *)a1;
        *(_OWORD *)a1 = *v6;
        *long long v6 = v7;
      }
      return result;
    case 3:
      sub_D66CC((long long *)a1, (unsigned int *)(a1 + 16), (unsigned int *)&a2[-1]);
      return 1;
    case 4:
      sub_D6ABC((long long *)a1, (unsigned int *)(a1 + 16), (unsigned int *)(a1 + 32), (__n128 *)a2[-1].n128_u64);
      return 1;
    case 5:
      sub_D6B60((long long *)a1, (unsigned int *)(a1 + 16), (unsigned int *)(a1 + 32), (__n128 *)(a1 + 48), a2 - 1);
      return 1;
    default:
      unsigned int v8 = (unsigned int *)(a1 + 32);
      sub_D66CC((long long *)a1, (unsigned int *)(a1 + 16), (unsigned int *)(a1 + 32));
      unsigned int v9 = (unsigned int *)(a1 + 48);
      if ((__n128 *)(a1 + 48) == a2) {
        return 1;
      }
      uint64_t v10 = 0;
      int v11 = 0;
      break;
  }
  while (1)
  {
    long long v12 = *(_OWORD *)v9;
    unsigned int v13 = *(_OWORD *)v9;
    if (v13 > *v8)
    {
      uint64_t v14 = v10;
      while (1)
      {
        *(_OWORD *)(a1 + v14 + 48) = *(_OWORD *)(a1 + v14 + 32);
        if (v14 == -32) {
          break;
        }
        unsigned int v15 = *(_DWORD *)(a1 + v14 + 16);
        v14 -= 16;
        if (v13 <= v15)
        {
          unint64_t v16 = (_OWORD *)(a1 + v14 + 48);
          goto LABEL_12;
        }
      }
      unint64_t v16 = (_OWORD *)a1;
LABEL_12:
      *unint64_t v16 = v12;
      if (++v11 == 8) {
        return v9 + 4 == (unsigned int *)a2;
      }
    }
    unsigned int v8 = v9;
    v10 += 16;
    v9 += 4;
    if (v9 == (unsigned int *)a2) {
      return 1;
    }
  }
}

__n128 sub_D6ABC(long long *a1, unsigned int *a2, unsigned int *a3, _OWORD *a4)
{
  sub_D66CC(a1, a2, a3);
  if (*(_DWORD *)a4 > *a3)
  {
    __n128 result = *(__n128 *)a3;
    *(_OWORD *)a3 = *a4;
    *a4 = result;
    if (*a3 > *a2)
    {
      __n128 result = *(__n128 *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(__n128 *)a3 = result;
      if (*a2 > *(_DWORD *)a1)
      {
        __n128 result = (__n128)*a1;
        *a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }
  return result;
}

__n128 sub_D6B60(long long *a1, unsigned int *a2, unsigned int *a3, __n128 *a4, __n128 *a5)
{
  result.n128_u64[0] = sub_D6ABC(a1, a2, a3, a4).n128_u64[0];
  if (a5->n128_u32[0] > a4->n128_u32[0])
  {
    __n128 result = *a4;
    *a4 = *a5;
    *a5 = result;
    if (a4->n128_u32[0] > *a3)
    {
      __n128 result = *(__n128 *)a3;
      *(__n128 *)a3 = *a4;
      *a4 = result;
      if (*a3 > *a2)
      {
        __n128 result = *(__n128 *)a2;
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *(__n128 *)a3 = result;
        if (*a2 > *(_DWORD *)a1)
        {
          __n128 result = (__n128)*a1;
          *a1 = *(_OWORD *)a2;
          *(__n128 *)a2 = result;
        }
      }
    }
  }
  return result;
}

long long *sub_D6C30(long long *a1, long long *a2, long long *a3, uint64_t a4)
{
  if (a1 != a2)
  {
    long long v6 = a2;
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = a2 - a1;
    if ((char *)a2 - (char *)a1 >= 17)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      long long v12 = &a1[v10];
      do
      {
        sub_D6E30((uint64_t)a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    unsigned int v13 = v6;
    if (v6 != a3)
    {
      uint64_t v14 = v6;
      do
      {
        if (*(_DWORD *)v14 > *(_DWORD *)a1)
        {
          long long v15 = *v14;
          long long *v14 = *a1;
          *a1 = v15;
          sub_D6E30((uint64_t)a1, a4, v9, a1);
        }
        ++v14;
      }
      while (v14 != a3);
      unsigned int v13 = a3;
    }
    if (v8 >= 17)
    {
      uint64_t v16 = (unint64_t)v8 >> 4;
      do
      {
        uint64_t v17 = 0;
        long long v30 = *a1;
        uint64_t v18 = a1;
        do
        {
          uint64_t v19 = (uint64_t)&v18[v17 + 1];
          uint64_t v20 = (2 * v17) | 1;
          uint64_t v21 = 2 * v17 + 2;
          if (v21 < v16 && *(_DWORD *)v19 > *(_DWORD *)(v19 + 16))
          {
            v19 += 16;
            uint64_t v20 = v21;
          }
          _OWORD *v18 = *(_OWORD *)v19;
          uint64_t v18 = (_OWORD *)v19;
          uint64_t v17 = v20;
        }
        while (v20 <= (uint64_t)((unint64_t)(v16 - 2) >> 1));
        if ((long long *)v19 == --v6)
        {
          *(_OWORD *)uint64_t v19 = v30;
        }
        else
        {
          *(_OWORD *)uint64_t v19 = *v6;
          *long long v6 = v30;
          uint64_t v22 = v19 - (void)a1 + 16;
          if (v22 >= 17)
          {
            unint64_t v23 = (((unint64_t)v22 >> 4) - 2) >> 1;
            uint64_t v24 = &a1[v23];
            uint64_t v25 = *(void *)v19;
            if (*(_DWORD *)v24 > *(void *)v19)
            {
              uint64_t v26 = *(void *)(v19 + 8);
              do
              {
                float v27 = v24;
                *(_OWORD *)uint64_t v19 = *v24;
                if (!v23) {
                  break;
                }
                unint64_t v23 = (v23 - 1) >> 1;
                uint64_t v24 = &a1[v23];
                uint64_t v19 = (uint64_t)v27;
              }
              while (*(_DWORD *)v24 > v25);
              *(void *)float v27 = v25;
              *((void *)v27 + 1) = v26;
            }
          }
        }
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_D6E30(uint64_t result, uint64_t a2, uint64_t a3, long long *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 4)
    {
      uint64_t v6 = v4 >> 3;
      uint64_t v7 = (v4 >> 3) + 1;
      uint64_t v8 = (long long *)(result + 16 * v7);
      uint64_t v9 = v6 + 2;
      uint64_t v10 = *(void *)v8;
      if (v9 < a3 && v10 > *((void *)v8 + 2))
      {
        uint64_t v10 = *((void *)v8++ + 2);
        uint64_t v7 = v9;
      }
      long long v11 = *a4;
      unsigned int v12 = *a4;
      if (v12 >= v10)
      {
        do
        {
          unsigned int v13 = v8;
          *a4 = *v8;
          if (v5 < v7) {
            break;
          }
          uint64_t v14 = (2 * v7) | 1;
          uint64_t v8 = (long long *)(result + 16 * v14);
          uint64_t v15 = 2 * v7 + 2;
          uint64_t v16 = *(void *)v8;
          if (v15 < a3 && v16 > *((void *)v8 + 2))
          {
            uint64_t v16 = *((void *)v8++ + 2);
            uint64_t v14 = v15;
          }
          a4 = v13;
          uint64_t v7 = v14;
        }
        while (v12 >= v16);
        *unsigned int v13 = v11;
      }
    }
  }
  return result;
}

void sub_D6EF0(__n128 *a1, long long *a2, uint64_t a3, uint64_t a4, char a5)
{
void *sub_D72C0(void *result, void *a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 2;
    if (result + 2 != a2)
    {
      uint64_t v3 = 0;
      uint64_t v4 = (float *)result;
      do
      {
        char v5 = v2;
        uint64_t v6 = *((void *)v4 + 2);
        if (*((float *)&v6 + 1) < v4[1])
        {
          uint64_t v7 = *((void *)v4 + 3);
          uint64_t v8 = v3;
          while (1)
          {
            *(_OWORD *)((char *)result + v8 + 16) = *(_OWORD *)((char *)result + v8);
            if (!v8) {
              break;
            }
            float v9 = *(float *)((char *)result + v8 - 12);
            v8 -= 16;
            if (*((float *)&v6 + 1) >= v9)
            {
              uint64_t v10 = (void *)((char *)result + v8 + 16);
              goto LABEL_10;
            }
          }
          uint64_t v10 = result;
LABEL_10:
          void *v10 = v6;
          v10[1] = v7;
        }
        uint64_t v2 = v5 + 2;
        v3 += 16;
        uint64_t v4 = (float *)v5;
      }
      while (v5 + 2 != a2);
    }
  }
  return result;
}

uint64_t sub_D734C(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    uint64_t v2 = result + 16;
    while (v2 != a2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)(result + 16);
      if (*((float *)&v4 + 1) < *(float *)(result + 4))
      {
        uint64_t v5 = *(void *)(result + 24);
        uint64_t v6 = v3;
        do
        {
          *(_OWORD *)uint64_t v6 = *(_OWORD *)(v6 - 16);
          float v7 = *(float *)(v6 - 28);
          v6 -= 16;
        }
        while (*((float *)&v4 + 1) < v7);
        *(void *)uint64_t v6 = v4;
        *(void *)(v6 + 8) = v5;
      }
      uint64_t v2 = v3 + 16;
      __n128 result = v3;
    }
  }
  return result;
}

uint64_t sub_D73B0(float *a1, float *a2, float *a3)
{
  float v3 = a2[1];
  float v4 = a3[1];
  if (v3 < a1[1])
  {
    if (v4 < v3)
    {
      long long v5 = *(_OWORD *)a1;
      *(_OWORD *)a1 = *(_OWORD *)a3;
      *(_OWORD *)a3 = v5;
      return 1;
    }
    long long v8 = *(_OWORD *)a1;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v8;
    if (a3[1] >= a2[1]) {
      return 1;
    }
    long long v9 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v9;
    return 2;
  }
  if (v4 < v3)
  {
    long long v6 = *(_OWORD *)a2;
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *(_OWORD *)a3 = v6;
    if (a2[1] >= a1[1]) {
      return 1;
    }
    long long v7 = *(_OWORD *)a1;
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)a2 = v7;
    return 2;
  }
  return 0;
}

unint64_t sub_D746C(float *a1, float *a2)
{
  long long v2 = *(_OWORD *)a1;
  LODWORD(v3) = HIDWORD(*(void *)a1);
  if (v3 >= *(a2 - 3))
  {
    long long v7 = a1 + 4;
    do
    {
      unint64_t v5 = (unint64_t)v7;
      if (v7 >= a2) {
        break;
      }
      float v8 = v7[1];
      v7 += 4;
    }
    while (v3 >= v8);
  }
  else
  {
    float v4 = a1;
    do
    {
      unint64_t v5 = (unint64_t)(v4 + 4);
      float v6 = v4[5];
      v4 += 4;
    }
    while (v3 >= v6);
  }
  if (v5 >= (unint64_t)a2)
  {
    long long v9 = a2;
  }
  else
  {
    do
    {
      long long v9 = a2 - 4;
      float v10 = *(a2 - 3);
      a2 -= 4;
    }
    while (v3 < v10);
  }
  while (v5 < (unint64_t)v9)
  {
    long long v14 = *(_OWORD *)v5;
    *(_OWORD *)unint64_t v5 = *(_OWORD *)v9;
    *(_OWORD *)long long v9 = v14;
    do
    {
      float v11 = *(float *)(v5 + 20);
      v5 += 16;
    }
    while (v3 >= v11);
    do
    {
      float v12 = *(v9 - 3);
      v9 -= 4;
    }
    while (v3 < v12);
  }
  if ((float *)(v5 - 16) != a1) {
    *(_OWORD *)a1 = *(_OWORD *)(v5 - 16);
  }
  *(_OWORD *)(v5 - 16) = v2;
  return v5;
}

long long *sub_D7554(long long *a1, float *a2)
{
  uint64_t v2 = 0;
  long long v3 = *a1;
  LODWORD(v4) = HIDWORD(*(void *)a1);
  do
    float v5 = *((float *)&a1[++v2] + 1);
  while (v5 < v4);
  float v6 = (float *)&a1[v2];
  long long v7 = &a1[v2 - 1];
  if (v2 == 1)
  {
    while (v6 < a2)
    {
      float v8 = a2 - 4;
      float v10 = *(a2 - 3);
      a2 -= 4;
      if (v10 < v4) {
        goto LABEL_9;
      }
    }
    float v8 = a2;
  }
  else
  {
    do
    {
      float v8 = a2 - 4;
      float v9 = *(a2 - 3);
      a2 -= 4;
    }
    while (v9 >= v4);
  }
LABEL_9:
  if (v6 < v8)
  {
    unint64_t v11 = (unint64_t)v6;
    float v12 = v8;
    do
    {
      long long v13 = *(_OWORD *)v11;
      *(_OWORD *)unint64_t v11 = *(_OWORD *)v12;
      *(_OWORD *)float v12 = v13;
      do
      {
        float v14 = *(float *)(v11 + 20);
        v11 += 16;
      }
      while (v14 < v4);
      do
      {
        float v15 = *(v12 - 3);
        v12 -= 4;
      }
      while (v15 >= v4);
    }
    while (v11 < (unint64_t)v12);
    long long v7 = (long long *)(v11 - 16);
  }
  if (v7 != a1) {
    *a1 = *v7;
  }
  long long *v7 = v3;
  return v7;
}

BOOL sub_D7640(__n128 *a1, __n128 *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      if (a2[-1].n128_f32[1] < a1->n128_f32[1])
      {
        __n128 v6 = *a1;
        *a1 = a2[-1];
        a2[-1] = v6;
      }
      return result;
    case 3:
      sub_D73B0((float *)a1, (float *)&a1[1], (float *)&a2[-1]);
      return 1;
    case 4:
      sub_D77F8((float *)a1, (uint64_t)&a1[1], (uint64_t)&a1[2], (uint64_t)&a2[-1]);
      return 1;
    case 5:
      sub_D789C((float *)a1, a1 + 1, a1 + 2, a1 + 3, a2 - 1);
      return 1;
    default:
      long long v7 = a1 + 2;
      sub_D73B0((float *)a1, (float *)&a1[1], (float *)&a1[2]);
      float v8 = a1 + 3;
      if (&a1[3] == a2) {
        return 1;
      }
      uint64_t v9 = 0;
      int v10 = 0;
      break;
  }
  while (1)
  {
    __n128 v11 = *v8;
    LODWORD(v12) = HIDWORD(v8->n128_u64[0]);
    if (v12 < v7->n128_f32[1])
    {
      uint64_t v13 = v9;
      while (1)
      {
        *(__n128 *)((char *)a1 + v13 + 48) = *(__n128 *)((char *)a1 + v13 + 32);
        if (v13 == -32) {
          break;
        }
        float v14 = *(float *)((char *)&a1[1].n128_f32[1] + v13);
        v13 -= 16;
        if (v12 >= v14)
        {
          float v15 = (__n128 *)((char *)a1 + v13 + 48);
          goto LABEL_12;
        }
      }
      float v15 = a1;
LABEL_12:
      *float v15 = v11;
      if (++v10 == 8) {
        return &v8[1] == a2;
      }
    }
    long long v7 = v8;
    v9 += 16;
    if (++v8 == a2) {
      return 1;
    }
  }
}

__n128 sub_D77F8(float *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_D73B0(a1, (float *)a2, (float *)a3);
  result.n128_u32[0] = *(_DWORD *)(a4 + 4);
  if (result.n128_f32[0] < *(float *)(a3 + 4))
  {
    __n128 result = *(__n128 *)a3;
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(__n128 *)a4 = result;
    result.n128_u32[0] = *(_DWORD *)(a3 + 4);
    if (result.n128_f32[0] < *(float *)(a2 + 4))
    {
      __n128 result = *(__n128 *)a2;
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(__n128 *)a3 = result;
      result.n128_u32[0] = *(_DWORD *)(a2 + 4);
      if (result.n128_f32[0] < a1[1])
      {
        __n128 result = *(__n128 *)a1;
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(__n128 *)a2 = result;
      }
    }
  }
  return result;
}

__n128 sub_D789C(float *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5)
{
  __n128 result = sub_D77F8(a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4);
  result.n128_u32[0] = a5->n128_u32[1];
  if (result.n128_f32[0] < a4->n128_f32[1])
  {
    __n128 result = *a4;
    *a4 = *a5;
    *a5 = result;
    result.n128_u32[0] = a4->n128_u32[1];
    if (result.n128_f32[0] < a3->n128_f32[1])
    {
      __n128 result = *a3;
      *a3 = *a4;
      *a4 = result;
      result.n128_u32[0] = a3->n128_u32[1];
      if (result.n128_f32[0] < a2->n128_f32[1])
      {
        __n128 result = *a2;
        *a2 = *a3;
        *a3 = result;
        result.n128_u32[0] = a2->n128_u32[1];
        if (result.n128_f32[0] < a1[1])
        {
          __n128 result = *(__n128 *)a1;
          *(__n128 *)a1 = *a2;
          *a2 = result;
        }
      }
    }
  }
  return result;
}

long long *sub_D796C(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  if ((long long *)a1 != a2)
  {
    __n128 v6 = a2;
    uint64_t v8 = (uint64_t)a2 - a1;
    uint64_t v9 = ((uint64_t)a2 - a1) >> 4;
    if ((uint64_t)a2 - a1 >= 17)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      float v12 = (long long *)(a1 + 16 * v10);
      do
      {
        sub_D7B20(a1, a4, v9, v12--);
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = v6;
    if (v6 != a3)
    {
      float v14 = v6;
      do
      {
        if (*((float *)v14 + 1) < *(float *)(a1 + 4))
        {
          long long v15 = *v14;
          long long *v14 = *(_OWORD *)a1;
          *(_OWORD *)a1 = v15;
          sub_D7B20(a1, a4, v9, (long long *)a1);
        }
        ++v14;
      }
      while (v14 != a3);
      uint64_t v13 = a3;
    }
    if (v8 >= 17)
    {
      uint64_t v16 = (unint64_t)v8 >> 4;
      do
      {
        uint64_t v17 = 0;
        long long v24 = *(_OWORD *)a1;
        uint64_t v18 = a1;
        do
        {
          uint64_t v19 = (_OWORD *)v18;
          v18 += 16 * v17 + 16;
          uint64_t v20 = 2 * v17;
          uint64_t v17 = (2 * v17) | 1;
          uint64_t v21 = v20 + 2;
          if (v21 < v16 && *(float *)(v18 + 4) < *(float *)(v18 + 20))
          {
            v18 += 16;
            uint64_t v17 = v21;
          }
          *uint64_t v19 = *(_OWORD *)v18;
        }
        while (v17 <= (uint64_t)((unint64_t)(v16 - 2) >> 1));
        if ((long long *)v18 == --v6)
        {
          *(_OWORD *)uint64_t v18 = v24;
        }
        else
        {
          *(_OWORD *)uint64_t v18 = *v6;
          *__n128 v6 = v24;
          sub_D7BE8(a1, v18 + 16, a4, (v18 + 16 - a1) >> 4);
        }
      }
      while (v16-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t sub_D7B20(uint64_t result, uint64_t a2, uint64_t a3, long long *a4)
{
  if (a3 >= 2)
  {
    uint64_t v4 = (uint64_t)a4 - result;
    int64_t v5 = (unint64_t)(a3 - 2) >> 1;
    if (v5 >= ((uint64_t)a4 - result) >> 4)
    {
      uint64_t v6 = v4 >> 3;
      uint64_t v7 = (v4 >> 3) + 1;
      uint64_t v8 = result + 16 * v7;
      uint64_t v9 = v6 + 2;
      if (v9 < a3 && *(float *)(v8 + 4) < *(float *)(v8 + 20))
      {
        v8 += 16;
        uint64_t v7 = v9;
      }
      long long v10 = *a4;
      LODWORD(v11) = HIDWORD(*(void *)a4);
      if (*(float *)(v8 + 4) >= v11)
      {
        do
        {
          float v12 = (long long *)v8;
          *a4 = *(_OWORD *)v8;
          if (v5 < v7) {
            break;
          }
          uint64_t v13 = 2 * v7;
          uint64_t v7 = (2 * v7) | 1;
          uint64_t v8 = result + 16 * v7;
          uint64_t v14 = v13 + 2;
          if (v14 < a3 && *(float *)(v8 + 4) < *(float *)(v8 + 20))
          {
            v8 += 16;
            uint64_t v7 = v14;
          }
          a4 = v12;
        }
        while (*(float *)(v8 + 4) >= v11);
        *float v12 = v10;
      }
    }
  }
  return result;
}

uint64_t sub_D7BE8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 >= 2)
  {
    unint64_t v4 = (unint64_t)(a4 - 2) >> 1;
    uint64_t v5 = result + 16 * v4;
    uint64_t v7 = (_OWORD *)(a2 - 16);
    uint64_t v6 = *(void *)(a2 - 16);
    if (*(float *)(v5 + 4) < *((float *)&v6 + 1))
    {
      uint64_t v8 = *(void *)(a2 - 8);
      do
      {
        uint64_t v9 = (void *)v5;
        _OWORD *v7 = *(_OWORD *)v5;
        if (!v4) {
          break;
        }
        unint64_t v4 = (v4 - 1) >> 1;
        uint64_t v5 = result + 16 * v4;
        uint64_t v7 = v9;
      }
      while (*(float *)(v5 + 4) < *((float *)&v6 + 1));
      *uint64_t v9 = v6;
      v9[1] = v8;
    }
  }
  return result;
}

void sub_D7C4C(char **a1, unint64_t a2)
{
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = a1[2];
  uint64_t v6 = a1[1];
  if (a2 <= (v5 - v6) >> 4)
  {
    a1[1] = &v6[16 * a2];
  }
  else
  {
    uint64_t v7 = *a1;
    uint64_t v8 = v6 - *a1;
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      sub_D60A4();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - v7;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12)
    {
      uint64_t v13 = (char *)sub_D6218(v4, v12);
      uint64_t v7 = *a1;
      uint64_t v6 = a1[1];
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = &v13[16 * v10];
    long long v15 = &v13[16 * v12];
    uint64_t v16 = &v14[16 * a2];
    if (v6 != v7)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v6 - 1);
        v14 -= 16;
        v6 -= 16;
      }
      while (v6 != v7);
      uint64_t v7 = *a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v7)
    {
      operator delete(v7);
    }
  }
}

void *sub_D7D58(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    __n128 result = sub_D7DD4(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      __n128 result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_D7DB8(_Unwind_Exception *exception_object)
{
  long long v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_D7DD4(void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_D60A4();
  }
  __n128 result = (char *)sub_D6218((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

char *sub_D7E18(int a1)
{
  uint64_t v1 = 0;
  while (*(_DWORD *)&aV024[v1] != a1)
  {
    v1 += 44;
    if (v1 == 3740) {
      return 0;
    }
  }
  return &aV024[v1];
}

uint64_t sub_D7E4C()
{
  return 85;
}

uint64_t sub_D7E54(_DWORD *a1)
{
  uint64_t v1 = 0;
  int v2 = a1[8];
  while (v2 != -1 && v2 != *(_DWORD *)&aV024[v1 + 32]
       || a1[6] != *(_DWORD *)&aV024[v1 + 24]
       || a1[3] != *(_DWORD *)&aV024[v1 + 12]
       || a1[1] != *(_DWORD *)&aV024[v1 + 4]
       || a1[2] != *(_DWORD *)&aV024[v1 + 8]
       || a1[4] != *(_DWORD *)&aV024[v1 + 16]
       || a1[5] != *(_DWORD *)&aV024[v1 + 20])
  {
    v1 += 44;
    if (v1 == 3740) {
      return 0;
    }
  }
  return *(unsigned int *)&aV024[v1];
}

uint64_t sub_D7F04(int a1, unsigned int *a2, int a3, int a4)
{
  int v12 = 0;
  uint64_t v4 = *a2;
  if ((int)v4 < 1)
  {
    int v6 = 23;
  }
  else
  {
    uint64_t v5 = a2 + 2;
    int v6 = 23;
    do
    {
      int v7 = v5[2];
      if (v7)
      {
        if (*v5 == a1)
        {
          uint64_t v8 = *(v5 - 1);
          if ((v8 - 1) <= 2)
          {
            if (!*((unsigned char *)&v12 + v8))
            {
              v6 += 3;
              *((unsigned char *)&v12 + v8) = 1;
            }
            int v6 = v6 + (v7 >> 3) - 2;
          }
        }
      }
      v5 += 4;
      --v4;
    }
    while (v4);
  }
  if (a3) {
    int v9 = a3 + 1;
  }
  else {
    int v9 = 0;
  }
  int v10 = a4 + 5;
  if (!a4) {
    int v10 = 0;
  }
  return (v10 + v9 + v6);
}

uint64_t sub_D7F9C(int a1, int a2, uint64_t a3, int *a4, uint64_t a5)
{
  if ((a2 - 1) > 2) {
    return 4294966295;
  }
  *(unsigned char *)a5 = a2 - 97;
  int v6 = *a4;
  if (*a4 < 1) {
    return 4294966295;
  }
  uint64_t v9 = 0;
  int v10 = 0;
  uint64_t v36 = a3 + 4;
  uint64_t result = 3;
  int v12 = "%lld %d AVE %s: %p: 0x%x";
  uint64_t v39 = a5;
  int v37 = a1;
  int v38 = a2;
  do
  {
    uint64_t v13 = &a4[4 * v9];
    unsigned int v14 = v13[4];
    if (v14)
    {
      long long v15 = v13 + 2;
      if (v13[2] == a1)
      {
        uint64_t v16 = v12;
        uint64_t v17 = v13 + 1;
        if (v13[1] == a2)
        {
          int v43 = v10;
          uint64_t v18 = v13 + 3;
          unsigned int v19 = (v14 >> 3) - 4;
          *(_WORD *)(a5 + (int)result) = bswap32(v19) >> 16;
          uint64_t v41 = (int)result + 2;
          unsigned __int16 v42 = v19;
          unint64_t v20 = (unsigned __int16)v19;
          memcpy((void *)(a5 + v41), (const void *)(v36 + (v13[3] >> 3)), (unsigned __int16)v19);
          if (sub_D1C38(0xD4u, 8))
          {
            int v21 = sub_D1C7C(0xD4u);
            __uint64_t v40 = sub_DDEFC();
            __n128 v22 = (const char *)sub_D1CB0(8);
            int v23 = *v15;
            if (v21)
            {
              printf("%lld %d AVE %s: type %d layer id %d\n", v40, 212, v22, *v17, v23);
              __uint64_t v24 = sub_DDEFC();
              uint64_t v25 = (const char *)sub_D1CB0(8);
              syslog(3, "%lld %d AVE %s: type %d layer id %d", v24, 212, v25, *v17, *v15);
            }
            else
            {
              syslog(3, "%lld %d AVE %s: type %d layer id %d", v40, 212, v22, *v17, v23);
            }
          }
          int v12 = v16;
          if (v20)
          {
            for (unint64_t i = 0; i < v20; i += 2)
            {
              if (sub_D1C38(0xD4u, 8))
              {
                int v27 = sub_D1C7C(0xD4u);
                __uint64_t v28 = sub_DDEFC();
                long long v29 = (const char *)sub_D1CB0(8);
                int v30 = *v18 >> 3;
                uint64_t v31 = a3 + v30;
                long long v32 = (const void *)(a3 + i + v30);
                uint64_t v33 = *(unsigned __int16 *)(v31 + i);
                if (v27)
                {
                  printf("%lld %d AVE %s: %p: 0x%x\n", v28, 212, v29, v32, v33);
                  __uint64_t v34 = sub_DDEFC();
                  float v35 = sub_D1CB0(8);
                  syslog(3, v12, v34, 212, v35, a3 + i + (*v18 >> 3), *(unsigned __int16 *)(a3 + (*v18 >> 3) + i));
                }
                else
                {
                  syslog(3, v12, v28, 212, v29, v32, v33);
                }
              }
            }
          }
          uint64_t result = v41 + v42;
          int v10 = v43 + 1;
          int v6 = *a4;
          a5 = v39;
          a1 = v37;
          a2 = v38;
        }
        else
        {
          int v12 = v16;
        }
      }
    }
    ++v9;
  }
  while (v9 < v6);
  if (!v10) {
    return 4294966295;
  }
  *(_WORD *)(a5 + 1) = BYTE1(v10) | (unsigned __int16)((_WORD)v10 << 8);
  return result;
}

uint64_t sub_D8264(int a1, uint64_t a2, unsigned int *a3, uint64_t a4, int a5, const void *a6, int a7, uint64_t a8, uint64_t a9, int a10)
{
  *(unsigned char *)a9 = 1;
  *(unsigned char *)(a9 + 1) = (*(unsigned char *)(a8 + 24) << 6) | (32 * (*(_DWORD *)(a8 + 28) != 0)) | *(_DWORD *)(a8 + 32);
  sub_DB814(a8, a9 + 2, 4);
  sub_DB868(a8, (unsigned char *)(a9 + 6), 6);
  *(unsigned char *)(a9 + 12) = *(_DWORD *)(a8 + 84);
  *(_WORD *)(a9 + 13) = 240;
  *(unsigned char *)(a9 + 15) = -4;
  *(unsigned char *)(a9 + 16) = *(unsigned char *)(a8 + 572) | 0xFC;
  *(unsigned char *)(a9 + 17) = *(unsigned char *)(a8 + 616) | 0xF8;
  *(unsigned char *)(a9 + 18) = *(unsigned char *)(a8 + 620) | 0xF8;
  *(_WORD *)(a9 + 19) = 0;
  *(unsigned char *)(a9 + 21) = 11;
  char v18 = sub_D854C(a3, a1);
  char v19 = a4 != 0;
  if (a6) {
    ++v19;
  }
  *(unsigned char *)(a9 + 22) = v19 + v18;
  int v20 = sub_D7F9C(a1, 1, a2, (int *)a3, a9 + 23);
  if (v20 < 1) {
    return 4294966296;
  }
  uint64_t v21 = (v20 + 23);
  int v22 = sub_D7F9C(a1, 2, a2, (int *)a3, a9 + v21);
  if (v22 < 1) {
    return 4294966296;
  }
  uint64_t v23 = (v22 + v21);
  int v24 = sub_D7F9C(a1, 3, a2, (int *)a3, a9 + v23);
  if (v24 < 1) {
    return 4294966296;
  }
  unint64_t v25 = v24 + (unint64_t)v23;
  if (a4)
  {
    *(unsigned char *)(a9 + v25) = -89;
    uint64_t v26 = a9 + v25;
    *(_WORD *)(v26 + 1) = 256;
    int v27 = a5 - 4;
    *(_WORD *)(v26 + 3) = BYTE1(v27) | (unsigned __int16)((_WORD)v27 << 8);
    unint64_t v25 = (v25 + 5);
    memcpy((void *)(a9 + v25), (const void *)(a4 + 4), v27);
    LODWORD(v25) = v25 + v27;
  }
  if (a6)
  {
    uint64_t v28 = a9 + (int)v25;
    *(unsigned char *)uint64_t v28 = -89;
    *(_WORD *)(v28 + 1) = 256;
    *(_WORD *)(v28 + 3) = BYTE1(a7) | (unsigned __int16)((_WORD)a7 << 8);
    uint64_t v29 = (int)v25 + 5;
    memcpy((void *)(a9 + v29), a6, a7);
    LODWORD(v25) = v29 + a7;
  }
  if ((int)v25 <= a10) {
    return 0;
  }
  if (sub_D1C38(0xD4u, 4))
  {
    int v30 = sub_D1C7C(0xD4u);
    __uint64_t v31 = sub_DDEFC();
    long long v32 = (const char *)sub_D1CB0(4);
    if (v30)
    {
      printf("%lld %d AVE %s: %s:%d offset > num %d > %d\n", v31, 212, v32, "AVE_PS_Compose_hvcC", 634, v25, a10);
      __uint64_t v31 = sub_DDEFC();
      sub_D1CB0(4);
    }
    syslog(3, "%lld %d AVE %s: %s:%d offset > num %d > %d", v31);
  }
  return 4294966277;
}

uint64_t sub_D854C(unsigned int *a1, int a2)
{
  if (a1)
  {
    uint64_t v4 = *a1;
    if ((int)v4 < 1)
    {
      return 0;
    }
    else
    {
      LODWORD(result) = 0;
      int v6 = (int *)(a1 + 2);
      do
      {
        int v7 = *v6;
        v6 += 4;
        if (v7 == a2) {
          uint64_t result = (result + 1);
        }
        else {
          uint64_t result = result;
        }
        --v4;
      }
      while (v4);
    }
  }
  else
  {
    if (sub_D1C38(0xD4u, 4))
    {
      int v8 = sub_D1C7C(0xD4u);
      __uint64_t v9 = sub_DDEFC();
      int v10 = (const char *)sub_D1CB0(4);
      if (v8)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameters %p %d\n", v9, 212, v10, "AVE_PS_CalcNumOfNALU", 369, "pInfo != __null", 0, a2);
        __uint64_t v9 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameters %p %d", v9, 212);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_D8690(int a1, unsigned int *a2)
{
  int v8 = 0;
  uint64_t v2 = *a2;
  if ((int)v2 < 1) {
    return 6;
  }
  long long v3 = a2 + 2;
  uint64_t v4 = 6;
  do
  {
    int v5 = v3[2];
    if (v5)
    {
      if (*v3 == a1)
      {
        uint64_t v6 = *(v3 - 1);
        if ((v6 & 0xFFFFFFFE) == 2)
        {
          if (!*((unsigned char *)&v8 + v6))
          {
            LODWORD(v4) = v4 + 3;
            *((unsigned char *)&v8 + v6) = 1;
          }
          uint64_t v4 = (v4 + (v5 >> 3) - 2);
        }
      }
    }
    v3 += 4;
    --v2;
  }
  while (v2);
  return v4;
}

uint64_t sub_D8710(int a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, int a6)
{
  *(_DWORD *)a5 = -67047423;
  *(unsigned char *)(a5 + 4) = -53;
  *(unsigned char *)(a5 + 5) = sub_D854C(a3, a1);
  int v11 = sub_D7F9C(a1, 2, a2, (int *)a3, a5 + 6);
  if (v11 < 1) {
    return 4294966296;
  }
  uint64_t v12 = (v11 + 6);
  int v13 = sub_D7F9C(a1, 3, a2, (int *)a3, a5 + v12);
  if (v13 < 1) {
    return 4294966296;
  }
  if (v13 + (int)v12 <= a6) {
    return 0;
  }
  return 4294966277;
}

uint64_t sub_D87D0(uint64_t a1, const void *a2, unsigned int *a3, const void *a4, uint64_t a5, const void *a6, int a7, const void *a8, __CFData **a9)
{
  if (!a2 || !a3 || !a8 || !a9 || (a4 == 0) != (a5 == 0))
  {
    if (sub_D1C38(0xD4u, 4))
    {
      int v15 = sub_D1C7C(0xD4u);
      __uint64_t v16 = sub_DDEFC();
      uint64_t v17 = (const char *)sub_D1CB0(4);
      if (v15)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameters %d %p %p %p %d %p %p\n", v16, 212, v17, "AVE_PS_Make_hvcC", 961, "pInData != __null && pInfo != __null && pSPS != __null && ppCFData != __null && !((pSEIData == __null) ^ (SEISize == 0))", a1, a2, a3, a4, a5, a8, a9);
        __uint64_t v16 = sub_DDEFC();
        int v66 = a8;
        __uint64_t v68 = a9;
        int v62 = a4;
        uint64_t v64 = a5;
        __uint64_t v58 = a2;
        __uint64_t v60 = a3;
        uint64_t v56 = a1;
        uint64_t v53 = sub_D1CB0(4);
      }
      else
      {
        int v66 = a8;
        __uint64_t v68 = a9;
        int v62 = a4;
        uint64_t v64 = a5;
        __uint64_t v58 = a2;
        __uint64_t v60 = a3;
        uint64_t v56 = a1;
        uint64_t v53 = (void *)v17;
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameters %d %p %p %p %d %p %p", v16, 212, v53, "AVE_PS_Make_hvcC", 961, "pInData != __null && pInfo != __null && pSPS != __null && ppCFData != __null && !((pSEIData == __null) ^ (SEISize == 0))", v56, v58, v60, v62, v64, v66, v68);
    }
    return 4294966296;
  }
  *a9 = 0;
  uint64_t v20 = sub_D7F04(a1, a3, a5, a7);
  uint64_t v21 = v20;
  if ((int)v20 <= 0)
  {
    if (sub_D1C38(0xD4u, 4))
    {
      uint64_t v33 = a1;
      int v34 = sub_D1C7C(0xD4u);
      __uint64_t v35 = sub_DDEFC();
      uint64_t v36 = (const char *)sub_D1CB0(4);
      if (v34)
      {
        printf("%lld %d AVE %s: %s:%d %s | failed to calculate the size %d %p %p %p %d %p %d\n", v35, 212, v36, "AVE_PS_Make_hvcC", 968, "size > 0", v33, a2, a3, a4, a5, a8, v21);
        __uint64_t v35 = sub_DDEFC();
        unsigned int v67 = a8;
        uint64_t v69 = v21;
        uint64_t v63 = a4;
        uint64_t v65 = a5;
        v59 = a2;
        __uint64_t v61 = a3;
        uint64_t v57 = v33;
        long long v55 = sub_D1CB0(4);
      }
      else
      {
        unsigned int v67 = a8;
        uint64_t v69 = v21;
        uint64_t v63 = a4;
        uint64_t v65 = a5;
        v59 = a2;
        __uint64_t v61 = a3;
        uint64_t v57 = v33;
        long long v55 = (void *)v36;
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | failed to calculate the size %d %p %p %p %d %p %d", v35, 212, v55, "AVE_PS_Make_hvcC", 968, "size > 0", v57, v59, v61, v63, v65, v67, v69);
    }
    return 4294966296;
  }
  uint64_t v72 = a1;
  CFIndex v22 = v20;
  Mutable = CFDataCreateMutable(0, v20);
  if (Mutable)
  {
    int v70 = v21;
    int v24 = Mutable;
    CFDataSetLength(Mutable, v22);
    v71 = v24;
    MutableBytePtr = CFDataGetMutableBytePtr(v24);
    if (MutableBytePtr)
    {
      uint64_t v26 = MutableBytePtr;
      uint64_t v27 = sub_D8264(v72, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, (uint64_t)a8, (uint64_t)MutableBytePtr, v70);
      if (sub_D1C38(0xD4u, 8))
      {
        int v28 = sub_D1C7C(0xD4u);
        __uint64_t v29 = sub_DDEFC();
        int v30 = (const char *)sub_D1CB0(8);
        if (v28)
        {
          printf("%lld %d AVE %s: hvcC data:\n", v29, 212, v30);
          __uint64_t v31 = sub_DDEFC();
          long long v54 = (const char *)sub_D1CB0(8);
          syslog(3, "%lld %d AVE %s: hvcC data:", v31, 212, v54);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: hvcC data:", v29, 212, v30);
        }
      }
      uint64_t v47 = 0;
      do
      {
        if (sub_D1C38(0xD4u, 8))
        {
          int v48 = sub_D1C7C(0xD4u);
          __uint64_t v49 = sub_DDEFC();
          uint64_t v50 = (const char *)sub_D1CB0(8);
          int v51 = *(unsigned __int16 *)&v26[v47];
          if (v48)
          {
            printf("%lld %d AVE %s: %p: 0x%x\n", v49, 212, v50, &v26[v47], v51);
            __uint64_t v49 = sub_DDEFC();
            uint64_t v50 = (const char *)sub_D1CB0(8);
            int v51 = *(unsigned __int16 *)&v26[v47];
          }
          syslog(3, "%lld %d AVE %s: %p: 0x%x", v49, 212, v50, &v26[v47], v51);
        }
        v47 += 2;
      }
      while (v70 > (int)v47);
      uint64_t v52 = v24;
      *a9 = v24;
      if (!v27) {
        return v27;
      }
    }
    else if (sub_D1C38(0xD4u, 4))
    {
      int v42 = sub_D1C7C(0xD4u);
      __uint64_t v43 = sub_DDEFC();
      unint64_t v44 = (const char *)sub_D1CB0(4);
      if (v42)
      {
        printf("%lld %d AVE %s: %s:%d %s | failed to get memory address %d %p %p %p %d %p %p %d\n", v43, 212, v44, "AVE_PS_Make_hvcC", 980, "pData != __null", v72, a2, a3, a4, a5, a8, v24, v70);
        __uint64_t v45 = sub_DDEFC();
        unint64_t v46 = (const char *)sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | failed to get memory address %d %p %p %p %d %p %p %d", v45, 212, v46, "AVE_PS_Make_hvcC", 980, "pData != __null", v72, a2, a3, a4, a5, a8, v71, v70);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | failed to get memory address %d %p %p %p %d %p %p %d", v43, 212, v44, "AVE_PS_Make_hvcC", 980, "pData != __null", v72, a2, a3, a4, a5, a8, v24, v70);
      }
      uint64_t v52 = v71;
      uint64_t v27 = 4294966293;
    }
    else
    {
      uint64_t v27 = 4294966293;
      uint64_t v52 = v24;
    }
    CFRelease(v52);
    return v27;
  }
  if (sub_D1C38(0xD4u, 4))
  {
    int v37 = sub_D1C7C(0xD4u);
    __uint64_t v38 = sub_DDEFC();
    uint64_t v39 = (const char *)sub_D1CB0(4);
    if (v37)
    {
      printf("%lld %d AVE %s: %s:%d %s | failed to allocate memory %d %p %p %p %d %p %d\n", v38, 212, v39, "AVE_PS_Make_hvcC", 973, "pCFData != __null", v72, a2, a3, a4, a5, a8, v21);
      __uint64_t v40 = sub_DDEFC();
      uint64_t v41 = sub_D1CB0(4);
      syslog(3, "%lld %d AVE %s: %s:%d %s | failed to allocate memory %d %p %p %p %d %p %d", v40, 212, v41, "AVE_PS_Make_hvcC", 973, "pCFData != __null", v72);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: %s:%d %s | failed to allocate memory %d %p %p %p %d %p %d", v38, 212, v39, "AVE_PS_Make_hvcC", 973, "pCFData != __null", v72);
    }
  }
  return 4294966293;
}

uint64_t sub_D8E94(uint64_t a1, const void *a2, unsigned int *a3, const void *a4, uint64_t a5, const void *a6, int a7, const void *a8, __CFDictionary **a9)
{
  int v10 = a5;
  unint64_t v44 = 0;
  if (!a2 || !a3 || !a8 || !a9 || (a4 == 0) != (a5 == 0))
  {
    if (sub_D1C38(0xD4u, 4))
    {
      int v15 = sub_D1C7C(0xD4u);
      __uint64_t v16 = sub_DDEFC();
      uint64_t v17 = (const char *)sub_D1CB0(4);
      if (v15)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameters %d %p %p %p %d %p %p\n", v16, 212, v17, "AVE_PS_Make_hvcC_Dict", 1039, "pInData != __null && pInfo != __null && pSPS != __null && ppCFDict != __null && !((pSEIData == __null) ^ (SEISize == 0))", a1, a2, a3, a4, v10, a8, a9);
        __uint64_t v18 = sub_DDEFC();
        uint64_t v41 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameters %d %p %p %p %d %p %p", v18, 212, v41, "AVE_PS_Make_hvcC_Dict", 1039, "pInData != __null && pInfo != __null && pSPS != __null && ppCFDict != __null && !((pSEIData == __null) ^ (SEISize == 0))", a1);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameters %d %p %p %p %d %p %p", v16, 212, v17, "AVE_PS_Make_hvcC_Dict", 1039, "pInData != __null && pInfo != __null && pSPS != __null && ppCFDict != __null && !((pSEIData == __null) ^ (SEISize == 0))", a1);
      }
    }
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 4294966296;
    goto LABEL_29;
  }
  *a9 = 0;
  int v19 = sub_D87D0(a1, a2, a3, a4, a5, a6, a7, a8, &v44);
  if (v19)
  {
    int v20 = v19;
    if (sub_D1C38(0xD4u, 4))
    {
      int v21 = sub_D1C7C(0xD4u);
      __uint64_t v22 = sub_DDEFC();
      uint64_t v23 = (const char *)sub_D1CB0(4);
      if (v21)
      {
        printf("%lld %d AVE %s: %s:%d %s | failed to compose %d %p %p %p %d %p %p %d\n", v22, 212, v23, "AVE_PS_Make_hvcC_Dict", 1047, "ret == 0", a1, a2, a3, a4, v10, a8, a9, v20);
        int v24 = a2;
        __uint64_t v25 = sub_DDEFC();
        int v42 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | failed to compose %d %p %p %p %d %p %p %d", v25, 212, v42, "AVE_PS_Make_hvcC_Dict", 1047, "ret == 0", a1, v24);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | failed to compose %d %p %p %p %d %p %p %d", v22, 212, v23, "AVE_PS_Make_hvcC_Dict", 1047, "ret == 0", a1, a2);
      }
    }
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      uint64_t v26 = Mutable;
      CFDictionaryAddValue(Mutable, @"hvcC", v44);
      int v30 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v30)
      {
        uint64_t v27 = v30;
        CFDictionaryAddValue(v30, kCMFormatDescriptionExtension_SampleDescriptionExtensionAtoms, v26);
        CFDictionaryAddValue(v27, kCMFormatDescriptionExtension_FormatName, @"HEVC");
        char v31 = 0;
        uint64_t v28 = 0;
        *a9 = v27;
        goto LABEL_30;
      }
      if (sub_D1C38(0xD4u, 4))
      {
        int v35 = sub_D1C7C(0xD4u);
        __uint64_t v36 = sub_DDEFC();
        int v37 = (const char *)sub_D1CB0(4);
        if (v35)
        {
          printf("%lld %d AVE %s: %s:%d %s | failed to create dictionary %d %p %p %p %d %p %p\n", v36, 212, v37, "AVE_PS_Make_hvcC_Dict", 1061, "pDict != __null", a1, a2, a3, a4, v10, a8, v26);
          __uint64_t v38 = sub_DDEFC();
          __uint64_t v43 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | failed to create dictionary %d %p %p %p %d %p %p", v38, 212, v43, "AVE_PS_Make_hvcC_Dict", 1061, "pDict != __null", a1);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | failed to create dictionary %d %p %p %p %d %p %p", v36, 212, v37, "AVE_PS_Make_hvcC_Dict", 1061, "pDict != __null", a1);
        }
      }
      goto LABEL_28;
    }
    if (sub_D1C38(0xD4u, 4))
    {
      int v32 = sub_D1C7C(0xD4u);
      __uint64_t v33 = sub_DDEFC();
      int v34 = (const char *)sub_D1CB0(4);
      if (v32)
      {
        printf("%lld %d AVE %s: %s:%d %s | failed to create data dictionary %d %p %p %p %d %p %p\n", v33, 212, v34, "AVE_PS_Make_hvcC_Dict", 1053, "pDataDict != __null", a1, a2, a3, a4, v10, a8, v44);
        __uint64_t v33 = sub_DDEFC();
        int v34 = (const char *)sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | failed to create data dictionary %d %p %p %p %d %p %p", v33, 212, v34, "AVE_PS_Make_hvcC_Dict", 1053, "pDataDict != __null", a1);
    }
  }
  uint64_t v26 = 0;
LABEL_28:
  uint64_t v27 = 0;
  uint64_t v28 = 4294966293;
LABEL_29:
  char v31 = 1;
LABEL_30:
  if (v44)
  {
    CFRelease(v44);
    unint64_t v44 = 0;
  }
  if (v26) {
    CFRelease(v26);
  }
  char v39 = v31 ^ 1;
  if (!v27) {
    char v39 = 1;
  }
  if ((v39 & 1) == 0) {
    CFRelease(v27);
  }
  return v28;
}

uint64_t sub_D9484(uint64_t a1, const void *a2, unsigned int *a3, const void *a4, __CFData **a5)
{
  if (!a2 || !a3 || !a4 || !a5)
  {
    if (sub_D1C38(0xD4u, 4))
    {
      int v21 = sub_D1C7C(0xD4u);
      __uint64_t v22 = sub_DDEFC();
      uint64_t v23 = (const char *)sub_D1CB0(4);
      if (v21)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameters %d %p %p %p %p\n", v22, 212, v23, "AVE_PS_Make_lhvC", 1118, "pInData != __null && pInfo != __null && pSPS != __null && ppCFData != __null", a1, a2, a3, a4, a5);
        __uint64_t v22 = sub_DDEFC();
        uint64_t v52 = a4;
        long long v54 = a5;
        int v48 = a2;
        uint64_t v50 = a3;
        uint64_t v46 = a1;
        int v42 = sub_D1CB0(4);
      }
      else
      {
        uint64_t v52 = a4;
        long long v54 = a5;
        int v48 = a2;
        uint64_t v50 = a3;
        uint64_t v46 = a1;
        int v42 = (void *)v23;
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameters %d %p %p %p %p", v22, 212, v42, "AVE_PS_Make_lhvC", 1118, "pInData != __null && pInfo != __null && pSPS != __null && ppCFData != __null", v46, v48, v50, v52, v54);
    }
    return 4294966296;
  }
  *a5 = 0;
  uint64_t v10 = sub_D8690(a1, a3);
  if ((int)v10 <= 0)
  {
    if (sub_D1C38(0xD4u, 4))
    {
      int v24 = sub_D1C7C(0xD4u);
      __uint64_t v25 = sub_DDEFC();
      uint64_t v26 = (const char *)sub_D1CB0(4);
      if (v24)
      {
        printf("%lld %d AVE %s: %s:%d %s | failed to calculate the size %d %p %p %p %d\n", v25, 212, v26, "AVE_PS_Make_lhvC", 1125, "size > 0", a1, a2, a3, a4, v10);
        __uint64_t v25 = sub_DDEFC();
        uint64_t v53 = a4;
        uint64_t v55 = v10;
        __uint64_t v49 = a2;
        int v51 = a3;
        uint64_t v47 = a1;
        __uint64_t v43 = sub_D1CB0(4);
      }
      else
      {
        uint64_t v53 = a4;
        uint64_t v55 = v10;
        __uint64_t v49 = a2;
        int v51 = a3;
        uint64_t v47 = a1;
        __uint64_t v43 = (void *)v26;
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | failed to calculate the size %d %p %p %p %d", v25, 212, v43, "AVE_PS_Make_lhvC", 1125, "size > 0", v47, v49, v51, v53, v55);
    }
    return 4294966296;
  }
  Mutable = CFDataCreateMutable(0, v10);
  if (Mutable)
  {
    uint64_t v12 = Mutable;
    CFDataSetLength(Mutable, v10);
    MutableBytePtr = CFDataGetMutableBytePtr(v12);
    if (MutableBytePtr)
    {
      int v15 = MutableBytePtr;
      uint64_t v56 = v12;
      uint64_t v16 = sub_D8710(a1, (uint64_t)a2, a3, v14, (uint64_t)MutableBytePtr, v10);
      if (sub_D1C38(0xD4u, 8))
      {
        int v17 = sub_D1C7C(0xD4u);
        __uint64_t v18 = sub_DDEFC();
        int v19 = (const char *)sub_D1CB0(8);
        if (v17)
        {
          printf("%lld %d AVE %s: lhvC data:\n", v18, 212, v19);
          __uint64_t v20 = sub_DDEFC();
          uint64_t v41 = (const char *)sub_D1CB0(8);
          syslog(3, "%lld %d AVE %s: lhvC data:", v20, 212, v41);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: lhvC data:", v18, 212, v19);
        }
      }
      uint64_t v36 = 0;
      do
      {
        if (sub_D1C38(0xD4u, 8))
        {
          int v37 = sub_D1C7C(0xD4u);
          __uint64_t v38 = sub_DDEFC();
          char v39 = (const char *)sub_D1CB0(8);
          int v40 = *(unsigned __int16 *)&v15[v36];
          if (v37)
          {
            printf("%lld %d AVE %s: %p: 0x%x\n", v38, 212, v39, &v15[v36], v40);
            __uint64_t v38 = sub_DDEFC();
            char v39 = (const char *)sub_D1CB0(8);
            int v40 = *(unsigned __int16 *)&v15[v36];
          }
          syslog(3, "%lld %d AVE %s: %p: 0x%x", v38, 212, v39, &v15[v36], v40);
        }
        v36 += 2;
      }
      while ((int)v10 > (int)v36);
      uint64_t v12 = v56;
      *a5 = v56;
      if (!v16) {
        return v16;
      }
    }
    else
    {
      if (sub_D1C38(0xD4u, 4))
      {
        int v31 = sub_D1C7C(0xD4u);
        __uint64_t v32 = sub_DDEFC();
        __uint64_t v33 = (const char *)sub_D1CB0(4);
        if (v31)
        {
          printf("%lld %d AVE %s: %s:%d %s | failed to get memory address %d %p %p %p %p %d\n", v32, 212, v33, "AVE_PS_Make_lhvC", 1137, "pData != __null", a1, a2, a3, a4, v12, v10);
          __uint64_t v34 = sub_DDEFC();
          __uint64_t v45 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | failed to get memory address %d %p %p %p %p %d", v34, 212, v45, "AVE_PS_Make_lhvC", 1137, "pData != __null");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | failed to get memory address %d %p %p %p %p %d", v32, 212, v33, "AVE_PS_Make_lhvC", 1137, "pData != __null");
        }
      }
      uint64_t v16 = 4294966293;
    }
    CFRelease(v12);
    return v16;
  }
  if (sub_D1C38(0xD4u, 4))
  {
    int v27 = sub_D1C7C(0xD4u);
    __uint64_t v28 = sub_DDEFC();
    __uint64_t v29 = (const char *)sub_D1CB0(4);
    if (v27)
    {
      printf("%lld %d AVE %s: %s:%d %s | failed to allocate memory %d %p %p %p %d\n", v28, 212, v29, "AVE_PS_Make_lhvC", 1130, "pCFData != __null", a1, a2, a3, a4, v10);
      __uint64_t v30 = sub_DDEFC();
      unint64_t v44 = sub_D1CB0(4);
      syslog(3, "%lld %d AVE %s: %s:%d %s | failed to allocate memory %d %p %p %p %d", v30, 212, v44, "AVE_PS_Make_lhvC", 1130);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: %s:%d %s | failed to allocate memory %d %p %p %p %d", v28, 212, v29, "AVE_PS_Make_lhvC", 1130);
    }
  }
  return 4294966293;
}

uint64_t sub_D9A2C(uint64_t a1, const void *a2, unsigned int *a3, const void *a4, __CFData *a5)
{
  int v40 = 0;
  if (a2 && a3 && a4 && a5)
  {
    uint64_t v10 = sub_D9484(a1, a2, a3, a4, &v40);
    if (v10)
    {
      uint64_t v11 = v10;
      if (!sub_D1C38(0xD4u, 4))
      {
LABEL_18:
        uint64_t v23 = 4294966293;
        goto LABEL_19;
      }
      int v12 = sub_D1C7C(0xD4u);
      __uint64_t v13 = sub_DDEFC();
      uint64_t v14 = (const char *)sub_D1CB0(4);
      if (!v12)
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | failed to compose %d %p %p %p %p %d", v13, 212, v14, "AVE_PS_Add_lhvC_Dict", 1270, "ret == 0");
        goto LABEL_18;
      }
      uint64_t v15 = a1;
      printf("%lld %d AVE %s: %s:%d %s | failed to compose %d %p %p %p %p %d\n", v13, 212, v14, "AVE_PS_Add_lhvC_Dict", 1270, "ret == 0", a1, a2, a3, a4, a5, v11);
      __uint64_t v16 = sub_DDEFC();
      __uint64_t v38 = a5;
      uint64_t v39 = v11;
      uint64_t v36 = a3;
      int v37 = a4;
      uint64_t v34 = v15;
      int v35 = a2;
      uint64_t v32 = 1270;
      __uint64_t v33 = "ret == 0";
      __uint64_t v30 = sub_D1CB0(4);
      int v17 = "%lld %d AVE %s: %s:%d %s | failed to compose %d %p %p %p %p %d";
    }
    else
    {
      CFStringRef Value = (__CFDictionary *)CFDictionaryGetValue(a5, kCMFormatDescriptionExtension_SampleDescriptionExtensionAtoms);
      if (Value)
      {
        CFDictionaryAddValue(Value, @"lhvC", v40);
        uint64_t v23 = 0;
        goto LABEL_19;
      }
      if (!sub_D1C38(0xD4u, 4)) {
        goto LABEL_18;
      }
      int v25 = sub_D1C7C(0xD4u);
      __uint64_t v26 = sub_DDEFC();
      int v27 = (const char *)sub_D1CB0(4);
      if (!v25)
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | failed to get data dictionary %d %p %p %p %p", v26, 212, v27, "AVE_PS_Add_lhvC_Dict", 1276);
        goto LABEL_18;
      }
      uint64_t v28 = a1;
      printf("%lld %d AVE %s: %s:%d %s | failed to get data dictionary %d %p %p %p %p\n", v26, 212, v27, "AVE_PS_Add_lhvC_Dict", 1276, "pDataDict != __null", a1, a2, a3, a4, v40);
      __uint64_t v16 = sub_DDEFC();
      __uint64_t v29 = sub_D1CB0(4);
      int v37 = a4;
      __uint64_t v38 = v40;
      int v35 = a2;
      uint64_t v36 = a3;
      __uint64_t v33 = "pDataDict != __null";
      uint64_t v34 = v28;
      uint64_t v32 = 1276;
      __uint64_t v30 = v29;
      int v17 = "%lld %d AVE %s: %s:%d %s | failed to get data dictionary %d %p %p %p %p";
    }
    syslog(3, v17, v16, 212, v30, "AVE_PS_Add_lhvC_Dict", v32, v33, v34, v35, v36, v37, v38, v39);
    goto LABEL_18;
  }
  if (sub_D1C38(0xD4u, 4))
  {
    int v18 = sub_D1C7C(0xD4u);
    __uint64_t v19 = sub_DDEFC();
    __uint64_t v20 = (const char *)sub_D1CB0(4);
    if (v18)
    {
      printf("%lld %d AVE %s: %s:%d %s | wrong parameters %d %p %p %p %p\n", v19, 212, v20, "AVE_PS_Add_lhvC_Dict", 1265, "pInData != __null && pInfo != __null && pSPS != __null && pCFDict != __null", a1, a2, a3, a4, a5);
      __uint64_t v21 = sub_DDEFC();
      int v31 = sub_D1CB0(4);
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameters %d %p %p %p %p", v21, 212, v31, "AVE_PS_Add_lhvC_Dict", 1265);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameters %d %p %p %p %p", v19, 212, v20, "AVE_PS_Add_lhvC_Dict", 1265);
    }
  }
  uint64_t v23 = 4294966296;
LABEL_19:
  if (v40) {
    CFRelease(v40);
  }
  return v23;
}

uint64_t sub_D9DB4(CFDictionaryRef theDict, uint64_t a2)
{
  int v14 = 0;
  if (theDict && a2)
  {
    int v4 = sub_C38FC(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData_Acknowledged, (BOOL *)a2);
    int v5 = sub_C38FC(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData_Reserved, (BOOL *)(a2 + 1)) + v4;
    int v6 = sub_C43BC(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData_CadenceIndex, &v14);
    *(unsigned char *)(a2 + 2) = v14;
    int v7 = v5
       + v6
       + sub_C38FC(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData_CadenceAnchor, (BOOL *)(a2 + 3));
    return v7
         + sub_C43BC(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData_RefFrameNum, (_DWORD *)(a2 + 4));
  }
  else
  {
    if (sub_D1C38(0xE2u, 4))
    {
      int v9 = sub_D1C7C(0xE2u);
      __uint64_t v10 = sub_DDEFC();
      uint64_t v11 = (const char *)sub_D1CB0(4);
      if (v9)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d\n", v10, 226, v11, "AVE_DRC_RetrieveMetaData", 25, "pDict != __null && pMetaData != __null", theDict, (const void *)a2, 0);
        __uint64_t v12 = sub_DDEFC();
        __uint64_t v13 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v12, 226, v13);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v10, 226, v11);
      }
    }
    return 4294966295;
  }
}

uint64_t sub_D9F74(unsigned __int8 *a1, CFMutableDictionaryRef theDict)
{
  if (a1 && theDict)
  {
    int v4 = sub_C30C8(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData_Acknowledged, *a1, theDict);
    int v5 = sub_C30C8(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData_Reserved, a1[1], theDict) + v4;
    int v6 = sub_C347C(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData_CadenceIndex, (char)a1[2], theDict);
    int v7 = v5 + v6 + sub_C30C8(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData_CadenceAnchor, a1[3], theDict);
    return v7
         + sub_C347C(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData_RefFrameNum, *((_DWORD *)a1 + 1), theDict);
  }
  else
  {
    if (sub_D1C38(0xE2u, 4))
    {
      int v9 = sub_D1C7C(0xE2u);
      __uint64_t v10 = sub_DDEFC();
      uint64_t v11 = (const char *)sub_D1CB0(4);
      if (v9)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d\n", v10, 226, v11, "AVE_DRC_MakeMetaData", 60, "pMetaData != __null && pDict != __null", a1, theDict, 0);
        __uint64_t v12 = sub_DDEFC();
        __uint64_t v13 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v12, 226, v13);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v10, 226, v11);
      }
    }
    return 4294966295;
  }
}

uint64_t sub_DA128(CFDictionaryRef theDict, _DWORD *a2)
{
  int v33 = 0;
  if (theDict && a2)
  {
    sub_C43BC(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_ReferenceType, &v33);
    *a2 = v33;
    sub_C43BC(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_FrameNumber, &v33);
    a2[1] = v33;
    sub_C43BC(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_FrameNumberFromIDR, &v33);
    a2[2] = v33;
    sub_C466C(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_PresentationTimestamp, (void *)a2 + 2);
    sub_C43BC(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_PTSTimescale, &v33);
    a2[6] = v33;
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_OriginalBuffer);
    if (Value)
    {
      CFDictionaryRef v5 = Value;
      int v6 = (void *)kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_Width;
      sub_C43BC(Value, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_Width, &v33);
      a2[12] = v33;
      int v7 = (void *)kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_Height;
      sub_C43BC(v5, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_Height, &v33);
      a2[14] = v33;
      int v8 = (void *)kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_IOSurfaceID;
      sub_C43BC(v5, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_IOSurfaceID, &v33);
      a2[16] = v33;
      CFDictionaryRef v9 = (const __CFDictionary *)CFDictionaryGetValue(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_RVRABuffer);
      if (v9)
      {
        CFDictionaryRef v10 = v9;
        sub_C43BC(v9, v6, &v33);
        a2[13] = v33;
        sub_C43BC(v10, v7, &v33);
        a2[15] = v33;
        sub_C43BC(v10, v8, &v33);
        a2[17] = v33;
        CFDictionaryRef v11 = (const __CFDictionary *)CFDictionaryGetValue(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData);
        uint64_t v12 = sub_D9DB4(v11, (uint64_t)(a2 + 18));
        if (v12 && sub_D1C38(0xE2u, 4))
        {
          int v13 = sub_D1C7C(0xE2u);
          __uint64_t v14 = sub_DDEFC();
          uint64_t v15 = (const char *)sub_D1CB0(4);
          if (v13)
          {
            printf("%lld %d AVE %s: %s:%d %s | fail to retrieve RC metadata %p %p %d\n", v14, 226, v15, "AVE_DPB_RetrieveSnapshotEntry", 150, "ret == 0", theDict, a2, v12);
            __uint64_t v16 = sub_DDEFC();
            __uint64_t v29 = sub_D1CB0(4);
            syslog(3, "%lld %d AVE %s: %s:%d %s | fail to retrieve RC metadata %p %p %d", v16, 226, v29);
          }
          else
          {
            syslog(3, "%lld %d AVE %s: %s:%d %s | fail to retrieve RC metadata %p %p %d", v14, 226, v15);
          }
        }
        return v12;
      }
      if (sub_D1C38(0xE2u, 4))
      {
        int v24 = sub_D1C7C(0xE2u);
        __uint64_t v25 = sub_DDEFC();
        __uint64_t v26 = (const char *)sub_D1CB0(4);
        if (v24)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to get VRA reference buffer %p %p %d\n", v25, 226, v26, "AVE_DPB_RetrieveSnapshotEntry", 131, "pTmpDict != __null", theDict, a2, 0);
          __uint64_t v27 = sub_DDEFC();
          uint64_t v32 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to get VRA reference buffer %p %p %d", v27, 226, v32);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to get VRA reference buffer %p %p %d", v25, 226, v26);
        }
      }
    }
    else if (sub_D1C38(0xE2u, 4))
    {
      int v21 = sub_D1C7C(0xE2u);
      __uint64_t v22 = sub_DDEFC();
      uint64_t v23 = (const char *)sub_D1CB0(4);
      if (v21)
      {
        printf("%lld %d AVE %s: %s:%d %s | fail to get original reference buffer %p %p %d\n", v22, 226, v23, "AVE_DPB_RetrieveSnapshotEntry", 113, "pTmpDict != __null", theDict, a2, 0);
        __uint64_t v22 = sub_DDEFC();
        int v31 = sub_D1CB0(4);
      }
      else
      {
        int v31 = (void *)v23;
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | fail to get original reference buffer %p %p %d", v22, 226, v31);
    }
    return 4294966288;
  }
  if (sub_D1C38(0xE2u, 4))
  {
    int v17 = sub_D1C7C(0xE2u);
    __uint64_t v18 = sub_DDEFC();
    __uint64_t v19 = (const char *)sub_D1CB0(4);
    if (v17)
    {
      printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d\n", v18, 226, v19, "AVE_DPB_RetrieveSnapshotEntry", 92, "pDict != __null && pEntry != __null", theDict, a2, 0);
      __uint64_t v20 = sub_DDEFC();
      __uint64_t v30 = sub_D1CB0(4);
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v20, 226, v30);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v18, 226, v19);
    }
  }
  return 4294966295;
}

uint64_t sub_DA670(uint64_t a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    sub_C347C(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_ReferenceType, *(_DWORD *)a1, a2);
    sub_C347C(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_FrameNumber, *(_DWORD *)(a1 + 4), a2);
    sub_C347C(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_FrameNumberFromIDR, *(_DWORD *)(a1 + 8), a2);
    sub_C36BC(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_PresentationTimestamp, *(void *)(a1 + 16), a2);
    sub_C347C(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_PTSTimescale, *(_DWORD *)(a1 + 24), a2);
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      CFDictionaryRef v5 = Mutable;
      int v6 = (const void *)kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_Width;
      sub_C347C(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_Width, *(_DWORD *)(a1 + 48), Mutable);
      int v7 = (const void *)kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_Height;
      sub_C347C(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_Height, *(_DWORD *)(a1 + 56), v5);
      int v8 = (const void *)kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_IOSurfaceID;
      sub_C347C(kVTEncodeFrameOptionKey_DPB_ReferenceFrames_Buffers_IOSurfaceID, *(_DWORD *)(a1 + 64), v5);
      CFDictionaryAddValue(a2, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_OriginalBuffer, v5);
      CFRelease(v5);
      CFDictionaryRef v9 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v9)
      {
        CFDictionaryRef v10 = v9;
        sub_C347C(v6, *(_DWORD *)(a1 + 52), v9);
        sub_C347C(v7, *(_DWORD *)(a1 + 60), v10);
        sub_C347C(v8, *(_DWORD *)(a1 + 68), v10);
        CFDictionaryAddValue(a2, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_RVRABuffer, v10);
        CFRelease(v10);
        CFDictionaryRef v11 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = sub_D9F74((unsigned __int8 *)(a1 + 72), v11);
          if (v13)
          {
            if (sub_D1C38(0xE2u, 4))
            {
              int v14 = sub_D1C7C(0xE2u);
              __uint64_t v15 = sub_DDEFC();
              __uint64_t v16 = (const char *)sub_D1CB0(4);
              if (v14)
              {
                printf("%lld %d AVE %s: %s:%d %s | fail to make DRC metadata %p %p %d\n", v15, 226, v16, "AVE_DPB_MakeSnapshotEntry", 227, "ret == 0", (const void *)a1, a2, v13);
                __uint64_t v17 = sub_DDEFC();
                __uint64_t v29 = sub_D1CB0(4);
                syslog(3, "%lld %d AVE %s: %s:%d %s | fail to make DRC metadata %p %p %d", v17, 226, v29);
              }
              else
              {
                syslog(3, "%lld %d AVE %s: %s:%d %s | fail to make DRC metadata %p %p %d", v15, 226, v16);
              }
            }
          }
          else
          {
            CFDictionaryAddValue(a2, kVTEncodeFrameOptionKey_DPB_ReferenceFrames_SWRCMetaData, v12);
          }
          CFRelease(v12);
          return v13;
        }
        if (sub_D1C38(0xE2u, 4))
        {
          int v26 = sub_D1C7C(0xE2u);
          __uint64_t v23 = sub_DDEFC();
          int v24 = (const char *)sub_D1CB0(4);
          if (v26)
          {
            printf("%lld %d AVE %s: %s:%d %s | fail to create CFDict %p %p %d\n", v23, 226, v24, "AVE_DPB_MakeSnapshotEntry", 223, "pTmpDict != __null", (const void *)a1, a2, 0);
            goto LABEL_24;
          }
LABEL_30:
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CFDict %p %p %d", v23, 226, v24);
        }
        return 4294966293;
      }
      if (!sub_D1C38(0xE2u, 4)) {
        return 4294966293;
      }
      int v25 = sub_D1C7C(0xE2u);
      __uint64_t v23 = sub_DDEFC();
      int v24 = (const char *)sub_D1CB0(4);
      if (!v25) {
        goto LABEL_30;
      }
      printf("%lld %d AVE %s: %s:%d %s | fail to create CFDict %p %p %d\n", v23, 226, v24, "AVE_DPB_MakeSnapshotEntry", 206, "pTmpDict != __null", (const void *)a1, a2, 0);
    }
    else
    {
      if (!sub_D1C38(0xE2u, 4)) {
        return 4294966293;
      }
      int v22 = sub_D1C7C(0xE2u);
      __uint64_t v23 = sub_DDEFC();
      int v24 = (const char *)sub_D1CB0(4);
      if (!v22) {
        goto LABEL_30;
      }
      printf("%lld %d AVE %s: %s:%d %s | fail to create CFDict %p %p %d\n", v23, 226, v24, "AVE_DPB_MakeSnapshotEntry", 189, "pTmpDict != __null", (const void *)a1, a2, 0);
    }
LABEL_24:
    __uint64_t v27 = sub_DDEFC();
    int v31 = sub_D1CB0(4);
    syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CFDict %p %p %d", v27, 226, v31);
    return 4294966293;
  }
  if (sub_D1C38(0xE2u, 4))
  {
    int v18 = sub_D1C7C(0xE2u);
    __uint64_t v19 = sub_DDEFC();
    __uint64_t v20 = (const char *)sub_D1CB0(4);
    if (v18)
    {
      printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d\n", v19, 226, v20, "AVE_DPB_MakeSnapshotEntry", 170, "pEntry != __null && pDict != __null", (const void *)a1, a2, 0);
      __uint64_t v21 = sub_DDEFC();
      __uint64_t v30 = sub_D1CB0(4);
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v21, 226, v30);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v19, 226, v20);
    }
  }
  return 4294966295;
}

uint64_t sub_DABF0(CFDictionaryRef theDict, _DWORD *a2)
{
  int v36 = 0;
  if (!theDict || !a2)
  {
    if (sub_D1C38(0xE2u, 4))
    {
      int v14 = sub_D1C7C(0xE2u);
      __uint64_t v15 = sub_DDEFC();
      __uint64_t v16 = (const char *)sub_D1CB0(4);
      if (v14)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d\n", v15, 226, v16, "AVE_DPB_RetrieveSnapshot", 261, "pDict != __null && pSnapshot != __null", theDict, a2, 0);
        __uint64_t v17 = sub_DDEFC();
        int v33 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v17, 226, v33);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v15, 226, v16);
      }
    }
    return 4294966295;
  }
  sub_C43BC(theDict, kVTEncodeFrameOptionKey_DPB_FrameNumberFromIDR, &v36);
  a2[340] = v36;
  sub_C43BC(theDict, kVTEncodeFrameOptionKey_DPB_LongTermFrameNumberFromIDR, &v36);
  a2[341] = v36;
  sub_C43BC(theDict, kVTEncodeFrameOptionKey_DPB_HowManyShortTermFromIDR, &v36);
  a2[342] = v36;
  sub_C43BC(theDict, kVTEncodeFrameOptionKey_DPB_NumberOfReferenceFrames, &v36);
  int v4 = v36;
  a2[343] = v36;
  if (v4 >= 17)
  {
    if (sub_D1C38(0xE2u, 4))
    {
      int v18 = sub_D1C7C(0xE2u);
      __uint64_t v19 = sub_DDEFC();
      __uint64_t v20 = (const char *)sub_D1CB0(4);
      if (v18)
      {
        printf("%lld %d AVE %s: %s:%d %s | number of reference is out of range %d %d\n", v19, 226, v20, "AVE_DPB_RetrieveSnapshot", 274, "pSnapshot->num_ref_frame <= ((16) > (16) ? (16) : (16))", a2[343], 16);
        __uint64_t v19 = sub_DDEFC();
        __uint64_t v20 = (const char *)sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | number of reference is out of range %d %d", v19, 226, v20, "AVE_DPB_RetrieveSnapshot", 274, "pSnapshot->num_ref_frame <= ((16) > (16) ? (16) : (16))", a2[343], 16);
    }
    return 4294966296;
  }
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, kVTEncodeFrameOptionKey_DPB_ReferenceFrames);
  if (!Value)
  {
    if (sub_D1C38(0xE2u, 4))
    {
      int v21 = sub_D1C7C(0xE2u);
      __uint64_t v22 = sub_DDEFC();
      __uint64_t v23 = (const char *)sub_D1CB0(4);
      if (v21)
      {
        printf("%lld %d AVE %s: %s:%d %s | fail to get reference buffers %p %p %d\n", v22, 226, v23, "AVE_DPB_RetrieveSnapshot", 278, "pTmpArray != __null", theDict, a2, 0);
        __uint64_t v24 = sub_DDEFC();
        uint64_t v34 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | fail to get reference buffers %p %p %d", v24, 226, v34);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | fail to get reference buffers %p %p %d", v22, 226, v23);
      }
    }
    return 4294966288;
  }
  CFArrayRef v6 = Value;
  int Count = CFArrayGetCount(Value);
  int v8 = Count;
  if (Count > 17)
  {
    if (sub_D1C38(0xE2u, 4))
    {
      int v25 = sub_D1C7C(0xE2u);
      __uint64_t v26 = sub_DDEFC();
      __uint64_t v27 = (const char *)sub_D1CB0(4);
      if (v25)
      {
        printf("%lld %d AVE %s: %s:%d %s | number of reference buffer is out of range %d %d\n", v26, 226, v27, "AVE_DPB_RetrieveSnapshot", 284, "num <= (((16) > (16) ? (16) : (16)) + 1)", v8, 17);
        __uint64_t v26 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | number of reference buffer is out of range %d %d", v26);
    }
    return 4294966296;
  }
  if (Count < 1) {
    return 0;
  }
  CFIndex v9 = 0;
  uint64_t v10 = Count;
  for (unint64_t i = a2; ; i += 20)
  {
    CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, v9);
    uint64_t v13 = sub_DA128(ValueAtIndex, i);
    if (v13) {
      break;
    }
    if (v10 == ++v9) {
      return v13;
    }
  }
  if (sub_D1C38(0xE2u, 4))
  {
    int v28 = sub_D1C7C(0xE2u);
    __uint64_t v29 = sub_DDEFC();
    __uint64_t v30 = (const char *)sub_D1CB0(4);
    if (v28)
    {
      printf("%lld %d AVE %s: %s:%d %s | fail to retrieve one entry %p %p %p %d %d\n", v29, 226, v30, "AVE_DPB_RetrieveSnapshot", 293, "ret == 0", theDict, a2, ValueAtIndex, v9, v13);
      __uint64_t v31 = sub_DDEFC();
      int v35 = sub_D1CB0(4);
      syslog(3, "%lld %d AVE %s: %s:%d %s | fail to retrieve one entry %p %p %p %d %d", v31, 226, v35, "AVE_DPB_RetrieveSnapshot");
    }
    else
    {
      syslog(3, "%lld %d AVE %s: %s:%d %s | fail to retrieve one entry %p %p %p %d %d", v29, 226, v30, "AVE_DPB_RetrieveSnapshot");
    }
  }
  return v13;
}

uint64_t sub_DB194(int *a1, __CFDictionary *a2)
{
  if (a1 && a2)
  {
    sub_C347C(kVTEncodeFrameOptionKey_DPB_FrameNumberFromIDR, a1[340], a2);
    sub_C347C(kVTEncodeFrameOptionKey_DPB_LongTermFrameNumberFromIDR, a1[341], a2);
    sub_C347C(kVTEncodeFrameOptionKey_DPB_HowManyShortTermFromIDR, a1[342], a2);
    sub_C347C(kVTEncodeFrameOptionKey_DPB_NumberOfReferenceFrames, a1[343], a2);
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      CFMutableArrayRef v5 = Mutable;
      if (a1[343] < 0)
      {
        uint64_t v10 = 0;
LABEL_17:
        CFDictionaryAddValue(a2, kVTEncodeFrameOptionKey_DPB_ReferenceFrames, v5);
        CFRelease(v5);
        return v10;
      }
      CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v6)
      {
        int v7 = v6;
        uint64_t v8 = 0;
        CFIndex v9 = a1;
        while (1)
        {
          uint64_t v10 = sub_DA670((uint64_t)v9, v7);
          CFArrayAppendValue(v5, v7);
          CFRelease(v7);
          if (v8 >= a1[343]) {
            goto LABEL_17;
          }
          ++v8;
          int v7 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          v9 += 20;
          if (!v7) {
            goto LABEL_21;
          }
        }
      }
      LODWORD(v8) = 0;
      LODWORD(v10) = 0;
      CFIndex v9 = a1;
LABEL_21:
      if (sub_D1C38(0xE2u, 4))
      {
        int v19 = sub_D1C7C(0xE2u);
        __uint64_t v20 = sub_DDEFC();
        int v21 = (const char *)sub_D1CB0(4);
        if (v19)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to create CFDictionary %p %p %p %d %d\n", v20, 226, v21, "AVE_DPB_MakeSnapshot", 339, "pTmpDict != __null", a1, a2, v9, v8, v10);
          __uint64_t v22 = sub_DDEFC();
          __uint64_t v26 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CFDictionary %p %p %p %d %d", v22, 226, v26, "AVE_DPB_MakeSnapshot");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CFDictionary %p %p %p %d %d", v20, 226, v21, "AVE_DPB_MakeSnapshot");
        }
      }
      CFRelease(v5);
    }
    else if (sub_D1C38(0xE2u, 4))
    {
      int v15 = sub_D1C7C(0xE2u);
      __uint64_t v16 = sub_DDEFC();
      __uint64_t v17 = (const char *)sub_D1CB0(4);
      if (v15)
      {
        printf("%lld %d AVE %s: %s:%d %s | fail to create CFArray %p %p %d\n", v16, 226, v17, "AVE_DPB_MakeSnapshot", 329, "pTmpArray != __null", a1, a2, 0);
        __uint64_t v18 = sub_DDEFC();
        int v25 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CFArray %p %p %d", v18, 226, v25);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CFArray %p %p %d", v16, 226, v17);
      }
    }
    return 4294966293;
  }
  if (sub_D1C38(0xE2u, 4))
  {
    int v11 = sub_D1C7C(0xE2u);
    __uint64_t v12 = sub_DDEFC();
    uint64_t v13 = (const char *)sub_D1CB0(4);
    if (v11)
    {
      printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d\n", v12, 226, v13, "AVE_DPB_MakeSnapshot", 316, "pDict != __null && pSnapshot != __null", a2, a1, 0);
      __uint64_t v14 = sub_DDEFC();
      __uint64_t v24 = sub_D1CB0(4);
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v14, 226, v24);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v12, 226, v13);
    }
  }
  return 4294966295;
}

char *sub_DB5D4(int a1)
{
  if (a1 >= 31) {
    uint64_t result = 0;
  }
  else {
    uint64_t result = (char *)&unk_159F08 + 64 * (uint64_t)a1;
  }
  if (!*((void *)result + 2)) {
    sub_E57F8();
  }
  return result;
}

char *sub_DB60C(int a1)
{
  uint64_t v1 = 0;
  while (1)
  {
    uint64_t v2 = (char *)&unk_159F08 + v1;
    if (*(_DWORD *)((char *)&unk_159F08 + v1 + 4) == a1) {
      break;
    }
    v1 += 64;
    if (v1 == 1984)
    {
      uint64_t v2 = 0;
      break;
    }
  }
  if (!*((void *)v2 + 2)) {
    sub_E5824();
  }
  return v2;
}

uint64_t sub_DB65C(uint64_t result, int a2)
{
  switch((int)result)
  {
    case 1:
      if (!a2) {
        return 3;
      }
      if (a2 != 1) {
LABEL_8:
      }
        sub_E5850();
      return 4;
    case 2:
      return result;
    case 3:
      return 1;
    case 4:
      return 0;
    default:
      goto LABEL_8;
  }
}

char *sub_DB6D4(int a1, uint64_t a2, int a3)
{
  uint64_t result = sub_DB5D4(a1);
  if (result) {
    return *(char **)(*(void *)&result[8 * (int)sub_DB65C(a2, a3) + 24] + 16);
  }
  return result;
}

char *sub_DB724(int a1, uint64_t a2, int a3)
{
  uint64_t result = sub_DB5D4(a1);
  if (result) {
    return *(char **)(*(void *)&result[8 * (int)sub_DB65C(a2, a3) + 24] + 24);
  }
  return result;
}

char *sub_DB774(int a1, uint64_t a2, int a3)
{
  uint64_t result = sub_DB5D4(a1);
  if (result) {
    return *(char **)(*(void *)&result[8 * (int)sub_DB65C(a2, a3) + 24] + 32);
  }
  return result;
}

char *sub_DB7C4(int a1, uint64_t a2, int a3)
{
  uint64_t result = sub_DB5D4(a1);
  if (result) {
    return *(char **)(*(void *)&result[8 * (int)sub_DB65C(a2, a3) + 24] + 40);
  }
  return result;
}

uint64_t sub_DB814(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 < 4) {
    return 4294966277;
  }
  uint64_t v4 = 0;
  unsigned int v5 = 0;
  do
  {
    *(unsigned char *)(a2 + v5) |= *(unsigned char *)(a1 + 36 + v4) << (v4 & 7 ^ 7);
    if ((v4 & 7) == 7) {
      ++v5;
    }
    ++v4;
  }
  while (v4 != 32);
  return 4;
}

uint64_t sub_DB868(uint64_t a1, unsigned char *a2, int a3)
{
  if (a3 < 6) {
    return 4294966277;
  }
  bzero(a2, a3);
  char v7 = (*(unsigned char *)(a1 + 69) << 6) | (*(unsigned char *)(a1 + 68) << 7) | (32 * *(unsigned char *)(a1 + 70)) | (16 * *(unsigned char *)(a1 + 71));
  *a2 = v7;
  int v8 = *(_DWORD *)(a1 + 32);
  if (v8 == 4
    || v8 == 5
    || *(unsigned char *)(a1 + 40)
    || v8 == 6
    || *(unsigned char *)(a1 + 41)
    || v8 == 7
    || *(unsigned char *)(a1 + 42)
    || v8 == 8
    || *(unsigned char *)(a1 + 43)
    || v8 == 9
    || *(unsigned char *)(a1 + 44)
    || v8 == 10
    || *(unsigned char *)(a1 + 45)
    || v8 == 11
    || *(unsigned char *)(a1 + 46)
    || *(unsigned char *)(a1 + 47))
  {
    *a2 = (8 * *(unsigned char *)(a1 + 72)) | (4 * *(unsigned char *)(a1 + 73)) | (2 * *(unsigned char *)(a1 + 74)) | *(unsigned char *)(a1 + 75) | v7;
    v6.i32[0] = *(_DWORD *)(a1 + 76);
    uint16x4_t v9 = vshl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v6), (uint16x4_t)0x4000500060007);
    int v10 = v9.i32[0] | v9.i32[1] | ((*(void *)&v9 | HIDWORD(*(void *)&v9)) >> 16) | (8 * *(unsigned __int8 *)(a1 + 80));
  }
  else
  {
    if (v8 != 2 && !*(unsigned char *)(a1 + 38)) {
      return 5;
    }
    LOBYTE(v10) = 16 * *(unsigned char *)(a1 + 79);
  }
  a2[1] = v10;
  return 5;
}

uint64_t sub_DB9CC(unsigned __int8 *a1, int a2, int a3, int *a4)
{
  if (a2 < 1)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = 0;
    int v5 = 0;
    int v6 = -3;
    uint64_t v7 = a2;
    do
    {
      int v8 = *a1++;
      int v5 = v8 | (v5 << 8);
      if (v5 == 1)
      {
        if (v4 < a3) {
          int v9 = 2;
        }
        else {
          int v9 = 3;
        }
        int v10 = &a4[4 * v4];
        v10[1] = v9;
        v10[2] = v4 % a3;
        v10[3] = v6;
        if (v4 >= 1) {
          a4[4 * (v4 - 1) + 4] = v6 - a4[4 * (v4 - 1) + 3];
        }
        ++v4;
      }
      ++v6;
      --v7;
    }
    while (v7);
    if (v4 >= 1) {
      a4[4 * v4 + 4] = a2 - a4[4 * v4 + 3];
    }
  }
  *a4 = v4;
  return 0;
}

uint64_t sub_DBA68(unsigned __int8 *a1, int a2, int a3, int *a4)
{
  if (a2 < 1)
  {
    int v4 = 0;
  }
  else
  {
    int v4 = 0;
    int v5 = 0;
    int v6 = -3;
    uint64_t v7 = a2;
    do
    {
      int v8 = *a1++;
      int v5 = v8 | (v5 << 8);
      if (v5 == 1)
      {
        if (v4)
        {
          if (v4 <= a3) {
            int v9 = 2;
          }
          else {
            int v9 = 3;
          }
          int v10 = (v4 - 1) % a3;
        }
        else
        {
          int v10 = 0;
          int v9 = 1;
        }
        int v11 = &a4[4 * v4];
        v11[1] = v9;
        v11[2] = v10;
        v11[3] = v6;
        if (v4 >= 1) {
          a4[4 * (v4 - 1) + 4] = v6 - a4[4 * (v4 - 1) + 3];
        }
        ++v4;
      }
      ++v6;
      --v7;
    }
    while (v7);
    if (v4 >= 1) {
      a4[4 * v4 + 4] = a2 - a4[4 * v4 + 3];
    }
  }
  *a4 = v4;
  return 0;
}

uint64_t sub_DBB18(unsigned __int8 *a1, int a2, int a3, int a4, int *a5)
{
  if (a3 == 1)
  {
    sub_DBA68(a1, a2, a4, a5);
    return 0;
  }
  if (!a3)
  {
    sub_DB9CC(a1, a2, a4, a5);
    return 0;
  }
  return 4294966295;
}

uint64_t sub_DBB60(CFArrayRef theArray, _DWORD *a2, int *a3)
{
  if (theArray && a2 && a3 && *a3 > 0)
  {
    int Count = CFArrayGetCount(theArray);
    int v7 = *a3;
    if (Count < *a3) {
      int v7 = Count;
    }
    if (v7 >= 4) {
      int v8 = 4;
    }
    else {
      int v8 = v7;
    }
    if (v7 < 1)
    {
LABEL_17:
      uint64_t result = 0;
      *a3 = v8;
    }
    else
    {
      CFIndex v9 = 0;
      if (v8 <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v8;
      }
      int v11 = a2;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v9);
        if (!ValueAtIndex) {
          break;
        }
        CFDictionaryRef v13 = ValueAtIndex;
        sub_C43BC(ValueAtIndex, @"ReferenceFrameNumDriver", v11);
        sub_C43BC(v13, @"ReferenceRVRAIndex", v11 + 1);
        ++v9;
        v11 += 2;
        if (v10 == v9) {
          goto LABEL_17;
        }
      }
      if (sub_D1C38(0xE1u, 4))
      {
        int v19 = sub_D1C7C(0xE1u);
        __uint64_t v20 = sub_DDEFC();
        int v21 = (const char *)sub_D1CB0(4);
        if (v19)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to get data %p %p %p\n", v20, 225, v21, "AVE_VCP_Ref_RetrieveArray", 36, "pDict != __null", theArray, a2, a3);
          __uint64_t v22 = sub_DDEFC();
          __uint64_t v24 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to get data %p %p %p", v22, 225, v24);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to get data %p %p %p", v20, 225, v21);
        }
      }
      return 4294966288;
    }
  }
  else
  {
    if (sub_D1C38(0xE1u, 4))
    {
      int v15 = sub_D1C7C(0xE1u);
      __uint64_t v16 = sub_DDEFC();
      __uint64_t v17 = (const char *)sub_D1CB0(4);
      if (v15)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p\n", v16, 225, v17, "AVE_VCP_Ref_RetrieveArray", 25, "pArray != __null && pInfo != __null && pNum != __null && *pNum > 0", theArray, a2, a3);
        __uint64_t v18 = sub_DDEFC();
        __uint64_t v23 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v18, 225, v23);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %p", v16, 225, v17);
      }
    }
    return 4294966295;
  }
  return result;
}

uint64_t sub_DBE08(char *a1, int a2, __CFArray *a3)
{
  if (a1 && a2 >= 1 && a3)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 8 * a2;
    while (1)
    {
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (!Mutable) {
        break;
      }
      CFIndex v9 = Mutable;
      sub_C347C(@"ReferenceFrameNumDriver", *(_DWORD *)&a1[v6], Mutable);
      sub_C347C(@"ReferenceRVRAIndex", *(_DWORD *)&a1[v6 + 4], v9);
      CFArrayAppendValue(a3, v9);
      CFRelease(v9);
      v6 += 8;
      if (v7 == v6) {
        return 0;
      }
    }
    if (sub_D1C38(0xE1u, 4))
    {
      int v15 = sub_D1C7C(0xE1u);
      __uint64_t v16 = sub_DDEFC();
      __uint64_t v17 = (const char *)sub_D1CB0(4);
      if (v15)
      {
        printf("%lld %d AVE %s: %s:%d %s | fail to create CFDictionary %p %d %p\n", v16, 225, v17, "AVE_VCP_Ref_MakeArray", 73, "pDict != __null", a1, a2, a3);
        __uint64_t v18 = sub_DDEFC();
        __uint64_t v20 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CFDictionary %p %d %p", v18, 225, v20);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CFDictionary %p %d %p", v16, 225, v17);
      }
    }
    return 4294966293;
  }
  else
  {
    if (sub_D1C38(0xE1u, 4))
    {
      int v11 = sub_D1C7C(0xE1u);
      __uint64_t v12 = sub_DDEFC();
      CFDictionaryRef v13 = (const char *)sub_D1CB0(4);
      if (v11)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %d %p\n", v12, 225, v13, "AVE_VCP_Ref_MakeArray", 65, "pInfo != __null && iNum > 0 && pArray != __null", a1, a2, a3);
        __uint64_t v14 = sub_DDEFC();
        int v19 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %d %p", v14, 225, v19);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %d %p", v12, 225, v13);
      }
    }
    return 4294966295;
  }
}

uint64_t sub_DC0BC(CFDictionaryRef theDict, int a2, int *a3)
{
  if (a2 <= 4 && theDict && a3)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(theDict, @"WeightData_WeightFlagArray");
    CFArrayRef v7 = (const __CFArray *)CFDictionaryGetValue(theDict, @"WeightData_Weight");
    CFArrayRef v8 = (const __CFArray *)CFDictionaryGetValue(theDict, @"WeightData_Weight");
    CFArrayRef v9 = v8;
    if (Value && v7 && v8)
    {
      CFIndex Count = CFArrayGetCount(Value);
      CFIndex v11 = CFArrayGetCount(v7);
      CFIndex v12 = CFArrayGetCount(v9);
      if (a2 < 1)
      {
        return 0;
      }
      else
      {
        CFIndex v13 = 0;
        uint64_t v14 = 0;
        CFIndex v54 = v11;
        CFIndex v55 = Count;
        if ((int)Count >= (int)v11) {
          int v15 = v11;
        }
        else {
          int v15 = Count;
        }
        CFIndex v53 = v12;
        if (v15 >= (int)v12) {
          int v15 = v12;
        }
        CFIndex v16 = v15;
        uint64_t v56 = a2;
        CFIndex v60 = v15;
        while (2)
        {
          uint64_t v17 = 0;
          uint64_t v63 = v14;
          __uint64_t v18 = &a3[v14];
          int v19 = v18 + 11;
          __uint64_t v20 = v18 + 3;
          __uint64_t v58 = v18 + 67;
          v59 = v18 + 19;
          uint64_t v57 = v18 + 27;
          __uint64_t v61 = v18 + 3;
          CFIndex v62 = v13;
          do
          {
            v65[0] = 0;
            int v64 = 0;
            CFIndex v21 = v13 + v17;
            if (v13 + v17 >= v16)
            {
              if (sub_D1C38(0xD7u, 4))
              {
                int v43 = sub_D1C7C(0xD7u);
                __uint64_t v44 = sub_DDEFC();
                __uint64_t v45 = (const char *)sub_D1CB0(4);
                if (v43)
                {
                  printf("%lld %d AVE %s: %s:%d %s | Wrong WP array size %d %d %d %d\n", v44, 215, v45, "AVE_WtPred_RetrieveArray", 56, "arrayIdx < iFlagCnt && arrayIdx < iWeightCnt && arrayIdx < iOffsetCnt", v55, v54, v53, v13 + v17);
                  __uint64_t v44 = sub_DDEFC();
                  CFIndex v51 = v53;
                  CFIndex v52 = v13 + v17;
                  CFIndex v49 = v55;
                  CFIndex v50 = v54;
                  int v48 = sub_D1CB0(4);
                }
                else
                {
                  CFIndex v51 = v53;
                  CFIndex v52 = v13 + v17;
                  CFIndex v49 = v55;
                  CFIndex v50 = v54;
                  int v48 = (void *)v45;
                }
                syslog(3, "%lld %d AVE %s: %s:%d %s | Wrong WP array size %d %d %d %d", v44, 215, v48, "AVE_WtPred_RetrieveArray", 56, "arrayIdx < iFlagCnt && arrayIdx < iWeightCnt && arrayIdx < iOffsetCnt", v49, v50, v51, v52);
              }
              return 4294966295;
            }
            uint64_t result = sub_C2374(Value, v13 + v17, v65);
            if (result) {
              return result;
            }
            if (v17)
            {
              *int v19 = v65[0];
              uint64_t result = sub_C28C4(v7, v13 + v17, &v64);
              if (result) {
                return result;
              }
              if (*v19)
              {
                int v23 = v64;
                int v24 = a3[1];
              }
              else
              {
                int v24 = a3[1];
                int v23 = 1 << v24;
              }
              uint64_t v27 = (v17 - 1);
              int v28 = &a3[2 * v63];
              __uint64_t v29 = &v28[v27];
              v29[35] = v23;
              __uint64_t v30 = v29 + 35;
              v30[40] = (-1 << v24) + v23;
              uint64_t result = sub_C28C4(v9, v21, &v64);
              if (result) {
                return result;
              }
              if (*v19) {
                int v31 = v64;
              }
              else {
                int v31 = 0;
              }
              uint64_t v32 = &v28[v27];
              v32[51] = v31;
              int v33 = v31 + ((int)(*v30 << 7) >> a3[1]) - 128;
              if (v33 >= 511) {
                int v33 = 511;
              }
              if (v33 <= -512) {
                int v33 = -512;
              }
              v32[91] = v33;
              __uint64_t v20 = v61;
              CFIndex v13 = v62;
              CFIndex v16 = v60;
            }
            else
            {
              _DWORD *v20 = v65[0];
              uint64_t result = sub_C28C4(v7, v21, &v64);
              if (result) {
                return result;
              }
              if (*v20)
              {
                int v25 = v64;
                int v26 = *a3;
              }
              else
              {
                int v26 = *a3;
                int v25 = 1 << *a3;
              }
              int *v59 = v25;
              *__uint64_t v58 = (-1 << v26) + v25;
              uint64_t result = sub_C28C4(v9, v13, &v64);
              if (result) {
                return result;
              }
              if (*v20) {
                int v34 = v64;
              }
              else {
                int v34 = 0;
              }
              *uint64_t v57 = v34;
            }
            ++v17;
          }
          while (v17 != 3);
          uint64_t result = 0;
          uint64_t v14 = v63 + 1;
          v13 += 3;
          if (v63 + 1 != v56) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      if (sub_D1C38(0xD7u, 4))
      {
        int v39 = sub_D1C7C(0xD7u);
        __uint64_t v40 = sub_DDEFC();
        uint64_t v41 = (const char *)sub_D1CB0(4);
        if (v39)
        {
          printf("%lld %d AVE %s: %s:%d %s | CFArray not existing %p %p %p\n", v40, 215, v41, "AVE_WtPred_RetrieveArray", 39, "pFlagArray != __null && pWeightArray != __null && pOffsetArray != __null", Value, v7, v9);
          __uint64_t v42 = sub_DDEFC();
          uint64_t v47 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | CFArray not existing %p %p %p", v42, 215, v47);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | CFArray not existing %p %p %p", v40, 215, v41);
        }
      }
      return 4294966288;
    }
  }
  else
  {
    if (sub_D1C38(0xD7u, 4))
    {
      int v35 = sub_D1C7C(0xD7u);
      __uint64_t v36 = sub_DDEFC();
      int v37 = (const char *)sub_D1CB0(4);
      if (v35)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d\n", v36, 215, v37, "AVE_WtPred_RetrieveArray", 30, "pDict != __null && pInfo != __null && iFrameCount <= 4", theDict, a3, a2);
        __uint64_t v38 = sub_DDEFC();
        uint64_t v46 = sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v38, 215, v46);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p %d", v36, 215, v37);
      }
    }
    return 4294966295;
  }
  return result;
}

uint64_t sub_DC624(CFDictionaryRef theDict, int a2, _OWORD *a3)
{
  if (!theDict || !a3)
  {
    if (sub_D1C38(0xD7u, 4))
    {
      int v12 = sub_D1C7C(0xD7u);
      __uint64_t v13 = sub_DDEFC();
      uint64_t v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p\n", v13, 215, v14, "AVE_WtPred_GetInfo", 246, "pDict != __null && pInfo != __null", theDict, a3);
        __uint64_t v13 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p", v13, 215);
    }
    return 4294966295;
  }
  a3[24] = 0u;
  a3[25] = 0u;
  a3[22] = 0u;
  a3[23] = 0u;
  a3[20] = 0u;
  a3[21] = 0u;
  a3[18] = 0u;
  a3[19] = 0u;
  a3[16] = 0u;
  a3[17] = 0u;
  a3[14] = 0u;
  a3[15] = 0u;
  a3[12] = 0u;
  a3[13] = 0u;
  a3[10] = 0u;
  a3[11] = 0u;
  a3[8] = 0u;
  a3[9] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  *(_OWORD *)((char *)a3 + 412) = 0u;
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, @"WeightedPredictionInfo");
  if (!Value)
  {
    if (sub_D1C38(0xD7u, 4))
    {
      int v15 = sub_D1C7C(0xD7u);
      __uint64_t v16 = sub_DDEFC();
      uint64_t v17 = (const char *)sub_D1CB0(4);
      if (v15)
      {
        printf("%lld %d AVE %s: %s:%d %s | failed to get dictionary %p %p\n", v16, 215, v17, "AVE_WtPred_GetInfo", 254, "pWPInfoDict != __null", theDict, 0);
        __uint64_t v16 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | failed to get dictionary %p %p", v16, 215);
    }
    return 4294966288;
  }
  CFDictionaryRef v7 = Value;
  if (sub_D1C38(0x1Du, 6))
  {
    int v8 = sub_D1C7C(0x1Du);
    __uint64_t v9 = sub_DDEFC();
    uint64_t v10 = (const char *)sub_D1CB0(6);
    if (v8)
    {
      printf("%lld %d AVE %s: FIG: AVE_KEY_WP_INFO found \n", v9, 29, v10);
      __uint64_t v11 = sub_DDEFC();
      uint64_t v27 = (const char *)sub_D1CB0(6);
      syslog(3, "%lld %d AVE %s: FIG: AVE_KEY_WP_INFO found ", v11, 29, v27);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: FIG: AVE_KEY_WP_INFO found ", v9, 29, v10);
    }
  }
  uint64_t v19 = sub_C43BC(v7, @"WeightData_LumaLog2WeightDenom", a3);
  if (v19)
  {
    uint64_t v18 = v19;
    if (sub_D1C38(0xD7u, 4))
    {
      int v20 = sub_D1C7C(0xD7u);
      __uint64_t v21 = sub_DDEFC();
      __uint64_t v22 = (const char *)sub_D1CB0(4);
      if (v20)
      {
        printf("%lld %d AVE %s: %s:%d %s | fail to get data %p %p %d\n", v21, 215, v22, "AVE_WtPred_GetInfo", 261, "ret == 0", v7, a3, v18);
        __uint64_t v23 = sub_DDEFC();
        int v28 = sub_D1CB0(4);
LABEL_26:
        syslog(3, "%lld %d AVE %s: %s:%d %s | fail to get data %p %p %d", v23, 215, v28);
        return v18;
      }
      goto LABEL_33;
    }
    return v18;
  }
  uint64_t v24 = sub_C43BC(v7, @"WeightData_ChromaLog2WeightDenom", (_DWORD *)a3 + 1);
  if (v24)
  {
    uint64_t v18 = v24;
    if (sub_D1C38(0xD7u, 4))
    {
      int v25 = sub_D1C7C(0xD7u);
      __uint64_t v21 = sub_DDEFC();
      __uint64_t v22 = (const char *)sub_D1CB0(4);
      if (v25)
      {
        printf("%lld %d AVE %s: %s:%d %s | fail to get data %p %p %d\n", v21, 215, v22, "AVE_WtPred_GetInfo", 266, "ret == 0", v7, a3, v18);
        __uint64_t v23 = sub_DDEFC();
        int v28 = sub_D1CB0(4);
        goto LABEL_26;
      }
LABEL_33:
      syslog(3, "%lld %d AVE %s: %s:%d %s | fail to get data %p %p %d", v21, 215, v22);
    }
    return v18;
  }

  return sub_DC0BC(v7, a2, (int *)a3);
}

uint64_t sub_DCAF4(_DWORD *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  memset(v76, 0, sizeof(v76));
  if (!a1) {
    return 4294966295;
  }
  __uint64_t v9 = a1;
  sub_3444(a4, a5, (char *)v76, 32, a5, a6, a7, a8);
  if (sub_D1C38(a2, (char)a3))
  {
    int v10 = sub_D1C7C(a2);
    int v11 = v10;
    if (a3 < 0)
    {
      if (v10 && (-a3 & 0x20) == 0) {
        printf("WP %s luma_log2_weight_denom = %d\n", (const char *)v76, *v9);
      }
      syslog(3, "WP %s luma_log2_weight_denom = %d");
    }
    else
    {
      __uint64_t v12 = sub_DDEFC();
      __uint64_t v13 = (const char *)sub_D1CB0((char)a3);
      if ((a3 & 0x20) == 0 && v11)
      {
        printf("%lld %d AVE %s: WP %s luma_log2_weight_denom = %d\n", v12, a2, v13, (const char *)v76, *v9);
        sub_DDEFC();
        sub_D1CB0((char)a3);
      }
      syslog(3, "%lld %d AVE %s: WP %s luma_log2_weight_denom = %d");
    }
  }
  if (sub_D1C38(a2, (char)a3))
  {
    int v15 = sub_D1C7C(a2);
    int v16 = v15;
    if (a3 < 0)
    {
      if (v15 && (-a3 & 0x20) == 0) {
        printf("WP %s chroma_log2_weight_denom = %d\n", (const char *)v76, v9[1]);
      }
      syslog(3, "WP %s chroma_log2_weight_denom = %d");
    }
    else
    {
      __uint64_t v17 = sub_DDEFC();
      uint64_t v18 = (const char *)sub_D1CB0((char)a3);
      if ((a3 & 0x20) == 0 && v16)
      {
        printf("%lld %d AVE %s: WP %s chroma_log2_weight_denom = %d\n", v17, a2, v18, (const char *)v76, v9[1]);
        sub_DDEFC();
        sub_D1CB0((char)a3);
      }
      syslog(3, "%lld %d AVE %s: WP %s chroma_log2_weight_denom = %d");
    }
  }
  if (sub_D1C38(a2, (char)a3))
  {
    int v19 = sub_D1C7C(a2);
    int v20 = v19;
    if (a3 < 0)
    {
      if (v19 && (-a3 & 0x20) == 0) {
        printf("WP %s delta_chroma_log2_weight_denom = %d\n", (const char *)v76, v9[2]);
      }
      syslog(3, "WP %s delta_chroma_log2_weight_denom = %d");
    }
    else
    {
      __uint64_t v21 = sub_DDEFC();
      __uint64_t v22 = (const char *)sub_D1CB0((char)a3);
      if ((a3 & 0x20) == 0 && v20)
      {
        printf("%lld %d AVE %s: WP %s delta_chroma_log2_weight_denom = %d\n", v21, a2, v22, (const char *)v76, v9[2]);
        sub_DDEFC();
        sub_D1CB0((char)a3);
      }
      syslog(3, "%lld %d AVE %s: WP %s delta_chroma_log2_weight_denom = %d");
    }
  }
  uint64_t v23 = 0;
  int v74 = -a3;
  uint64_t v73 = v9 + 51;
  v71 = v9;
  do
  {
    if (sub_D1C38(a2, (char)a3))
    {
      int v24 = sub_D1C7C(a2);
      int v25 = v24;
      if (a3 < 0)
      {
        if (v24 && (v74 & 0x20) == 0) {
          printf("WP %s luma_weight_l0_flag[%d] = %d\n", (const char *)v76, v23, v9[v23 + 3]);
        }
        syslog(3, "WP %s luma_weight_l0_flag[%d] = %d");
      }
      else
      {
        __uint64_t v26 = sub_DDEFC();
        uint64_t v27 = (const char *)sub_D1CB0((char)a3);
        if ((a3 & 0x20) == 0 && v25)
        {
          printf("%lld %d AVE %s: WP %s luma_weight_l0_flag[%d] = %d\n", v26, a2, v27, (const char *)v76, v23, v9[v23 + 3]);
          sub_DDEFC();
          sub_D1CB0((char)a3);
        }
        syslog(3, "%lld %d AVE %s: WP %s luma_weight_l0_flag[%d] = %d");
      }
    }
    if (sub_D1C38(a2, (char)a3))
    {
      int v28 = sub_D1C7C(a2);
      int v29 = v28;
      if (a3 < 0)
      {
        if (v28 && (v74 & 0x20) == 0) {
          printf("WP %s luma_weight_l0[%d] = %d\n", (const char *)v76, v23, v9[v23 + 19]);
        }
        syslog(3, "WP %s luma_weight_l0[%d] = %d");
      }
      else
      {
        __uint64_t v30 = sub_DDEFC();
        int v31 = (const char *)sub_D1CB0((char)a3);
        if ((a3 & 0x20) == 0 && v29)
        {
          printf("%lld %d AVE %s: WP %s luma_weight_l0[%d] = %d\n", v30, a2, v31, (const char *)v76, v23, v9[v23 + 19]);
          sub_DDEFC();
          sub_D1CB0((char)a3);
        }
        syslog(3, "%lld %d AVE %s: WP %s luma_weight_l0[%d] = %d");
      }
    }
    if (sub_D1C38(a2, (char)a3))
    {
      int v32 = sub_D1C7C(a2);
      int v33 = v32;
      if (a3 < 0)
      {
        if (v32 && (v74 & 0x20) == 0) {
          printf("WP %s luma_offset_l0[%d] = %d\n", (const char *)v76, v23, v9[v23 + 27]);
        }
        syslog(3, "WP %s luma_offset_l0[%d] = %d");
      }
      else
      {
        __uint64_t v34 = sub_DDEFC();
        int v35 = (const char *)sub_D1CB0((char)a3);
        if ((a3 & 0x20) == 0 && v33)
        {
          printf("%lld %d AVE %s: WP %s luma_offset_l0[%d] = %d\n", v34, a2, v35, (const char *)v76, v23, v9[v23 + 27]);
          sub_DDEFC();
          sub_D1CB0((char)a3);
        }
        syslog(3, "%lld %d AVE %s: WP %s luma_offset_l0[%d] = %d");
      }
    }
    if (sub_D1C38(a2, (char)a3))
    {
      int v36 = sub_D1C7C(a2);
      int v37 = v36;
      if (a3 < 0)
      {
        if (v36 && (v74 & 0x20) == 0) {
          printf("WP %s delta_luma_weight_l0[%d] = %d\n", (const char *)v76, v23, v9[v23 + 67]);
        }
        syslog(3, "WP %s delta_luma_weight_l0[%d] = %d");
      }
      else
      {
        __uint64_t v38 = sub_DDEFC();
        int v39 = (const char *)sub_D1CB0((char)a3);
        if ((a3 & 0x20) == 0 && v37)
        {
          printf("%lld %d AVE %s: WP %s delta_luma_weight_l0[%d] = %d\n", v38, a2, v39, (const char *)v76, v23, v9[v23 + 67]);
          sub_DDEFC();
          sub_D1CB0((char)a3);
        }
        syslog(3, "%lld %d AVE %s: WP %s delta_luma_weight_l0[%d] = %d");
      }
    }
    if (sub_D1C38(a2, (char)a3))
    {
      int v40 = sub_D1C7C(a2);
      int v41 = v40;
      if (a3 < 0)
      {
        if (v40 && (v74 & 0x20) == 0) {
          printf("WP %s chroma_weight_l0_flag[%d] = %d\n", (const char *)v76, v23, v9[v23 + 11]);
        }
        syslog(3, "WP %s chroma_weight_l0_flag[%d] = %d");
      }
      else
      {
        __uint64_t v42 = sub_DDEFC();
        int v43 = (const char *)sub_D1CB0((char)a3);
        if ((a3 & 0x20) == 0 && v41)
        {
          printf("%lld %d AVE %s: WP %s chroma_weight_l0_flag[%d] = %d\n", v42, a2, v43, (const char *)v76, v23, v9[v23 + 11]);
          sub_DDEFC();
          sub_D1CB0((char)a3);
        }
        syslog(3, "%lld %d AVE %s: WP %s chroma_weight_l0_flag[%d] = %d");
      }
    }
    uint64_t v44 = v23;
    uint64_t v45 = 0;
    uint64_t v72 = v44;
    uint64_t v46 = v73;
    do
    {
      if (sub_D1C38(a2, (char)a3))
      {
        int v47 = sub_D1C7C(a2);
        int v48 = v47;
        if (a3 < 0)
        {
          if (v47 && (v74 & 0x20) == 0) {
            printf("WP %s chroma_weight_l0[%d][%d] = %d\n", (const char *)v76, v44, v45, *(v46 - 16));
          }
          syslog(3, "WP %s chroma_weight_l0[%d][%d] = %d");
        }
        else
        {
          __uint64_t v49 = sub_DDEFC();
          CFIndex v50 = (const char *)sub_D1CB0((char)a3);
          if ((a3 & 0x20) != 0 || !v48)
          {
            __uint64_t v68 = v49;
          }
          else
          {
            printf("%lld %d AVE %s: WP %s chroma_weight_l0[%d][%d] = %d\n", v49, a2, v50, (const char *)v76, v44, v45, *(v46 - 16));
            __uint64_t v51 = sub_DDEFC();
            sub_D1CB0((char)a3);
            __uint64_t v68 = v51;
          }
          syslog(3, "%lld %d AVE %s: WP %s chroma_weight_l0[%d][%d] = %d", v68);
        }
      }
      if (sub_D1C38(a2, (char)a3))
      {
        int v52 = sub_D1C7C(a2);
        int v53 = v52;
        if (a3 < 0)
        {
          if (v52 && (v74 & 0x20) == 0) {
            printf("WP %s chroma_offset_l0[%d][%d] = %d\n", (const char *)v76, v44, v45, *v46);
          }
          syslog(3, "WP %s chroma_offset_l0[%d][%d] = %d");
        }
        else
        {
          __uint64_t v54 = sub_DDEFC();
          CFIndex v55 = (const char *)sub_D1CB0((char)a3);
          if ((a3 & 0x20) != 0 || !v53)
          {
            syslog(3, "%lld %d AVE %s: WP %s chroma_offset_l0[%d][%d] = %d", v54, a2, v55);
          }
          else
          {
            printf("%lld %d AVE %s: WP %s chroma_offset_l0[%d][%d] = %d\n", v54, a2, v55, (const char *)v76, v44, v45, *v46);
            __uint64_t v56 = sub_DDEFC();
            uint64_t v57 = sub_D1CB0((char)a3);
            syslog(3, "%lld %d AVE %s: WP %s chroma_offset_l0[%d][%d] = %d", v56, a2, v57);
          }
        }
      }
      if (sub_D1C38(a2, (char)a3))
      {
        int v58 = sub_D1C7C(a2);
        int v59 = v58;
        if (a3 < 0)
        {
          if (v58 && (v74 & 0x20) == 0) {
            printf("WP %s delta_chroma_weight_l0[%d][%d] = %d\n", (const char *)v76, v44, v45, v46[24]);
          }
          syslog(3, "WP %s delta_chroma_weight_l0[%d][%d] = %d");
        }
        else
        {
          __uint64_t v60 = sub_DDEFC();
          __uint64_t v61 = (const char *)sub_D1CB0((char)a3);
          if ((a3 & 0x20) != 0 || !v59)
          {
            __uint64_t v69 = v60;
          }
          else
          {
            printf("%lld %d AVE %s: WP %s delta_chroma_weight_l0[%d][%d] = %d\n", v60, a2, v61, (const char *)v76, v44, v45, v46[24]);
            __uint64_t v62 = sub_DDEFC();
            sub_D1CB0((char)a3);
            __uint64_t v69 = v62;
          }
          syslog(3, "%lld %d AVE %s: WP %s delta_chroma_weight_l0[%d][%d] = %d", v69);
        }
      }
      if (sub_D1C38(a2, (char)a3))
      {
        int v63 = sub_D1C7C(a2);
        int v64 = v63;
        if (a3 < 0)
        {
          if (v63 && (v74 & 0x20) == 0) {
            printf("WP %s delta_chroma_offset_l0[%d][%d] = %d\n", (const char *)v76, v44, v45, v46[40]);
          }
          syslog(3, "WP %s delta_chroma_offset_l0[%d][%d] = %d");
        }
        else
        {
          __uint64_t v65 = sub_DDEFC();
          int v66 = (const char *)sub_D1CB0((char)a3);
          if ((a3 & 0x20) != 0 || !v64)
          {
            __uint64_t v70 = v65;
          }
          else
          {
            printf("%lld %d AVE %s: WP %s delta_chroma_offset_l0[%d][%d] = %d\n", v65, a2, v66, (const char *)v76, v44, v45, v46[40]);
            __uint64_t v67 = sub_DDEFC();
            sub_D1CB0((char)a3);
            __uint64_t v70 = v67;
          }
          syslog(3, "%lld %d AVE %s: WP %s delta_chroma_offset_l0[%d][%d] = %d", v70);
        }
      }
      ++v45;
      ++v46;
    }
    while (v45 != 2);
    uint64_t v23 = v44 + 1;
    v73 += 2;
    __uint64_t v9 = v71;
  }
  while (v72 != 3);
  return 0;
}

uint64_t sub_DD92C(char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t result = vsnprintf(a1, a2, a3, &a9);
  if (a1)
  {
    if ((int)result >= a2)
    {
      uint64_t result = a2 - 1;
      a1[result] = 0;
    }
  }
  return result;
}

char *sub_DD984(char *a1, const char *a2, int a3)
{
  uint64_t result = strncpy(a1, a2, a3);
  result[a3 - 1] = 0;
  return result;
}

double sub_DD9B4(uint64_t a1)
{
  *(void *)a1 = off_15BED8;
  *(void *)(a1 + 32) = a1 + 40;
  *(unsigned char *)(a1 + 4136) = 1;
  double result = 0.0;
  *(_OWORD *)(a1 + 8) = xmmword_150BA0;
  *(_DWORD *)(a1 + 24) = 0xFFFF;
  return result;
}

void sub_DDA00()
{
}

uint64_t sub_DDA14(uint64_t a1, char a2)
{
  int v2 = *(_DWORD *)(a1 + 24);
  int v3 = a2 & 1 | (2 * v2);
  *(_DWORD *)(a1 + 24) = v3;
  int v4 = *(_DWORD *)(a1 + 8) + 1;
  *(_DWORD *)(a1 + 8) = v4;
  if (v4 != 8) {
    return 0;
  }
  int v5 = v2 & 0x7FFFFE;
  if (*(unsigned char *)(a1 + 4136)) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    uint64_t v7 = *(int *)(a1 + 12);
    if ((int)v7 >= *(_DWORD *)(a1 + 20)) {
      return 4294966277;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)(a1 + 12) = v7 + 1;
    *(unsigned char *)(v8 + v7) = 3;
    int v3 = *(_DWORD *)(a1 + 24) | 0x300;
    *(_DWORD *)(a1 + 24) = v3;
    *(_DWORD *)(a1 + 16) += 8;
  }
  uint64_t v9 = *(int *)(a1 + 12);
  if ((int)v9 >= *(_DWORD *)(a1 + 20)) {
    return 4294966277;
  }
  uint64_t v10 = 0;
  uint64_t v11 = *(void *)(a1 + 32);
  *(_DWORD *)(a1 + 12) = v9 + 1;
  *(unsigned char *)(v11 + v9) = v3;
  *(_DWORD *)(a1 + 8) = 0;
  return v10;
}

uint64_t sub_DDAC8(uint64_t a1, unsigned int a2, int a3)
{
  if (!a3) {
    return 0;
  }
  int v3 = *(_DWORD *)(a1 + 8);
  while (1)
  {
    int v4 = 8 - v3;
    if (a3 < 8 - v3) {
      int v4 = a3;
    }
    v3 += v4;
    *(_DWORD *)(a1 + 8) = v3;
    a3 -= v4;
    int v5 = (a2 >> a3) & ~(-1 << v4) | (*(_DWORD *)(a1 + 24) << v4);
    *(_DWORD *)(a1 + 24) = v5;
    if (v3 != 8) {
      goto LABEL_12;
    }
    if (*(unsigned char *)(a1 + 4136) && (v5 & 0xFFFFFC) == 0)
    {
      uint64_t v6 = *(int *)(a1 + 12);
      if ((int)v6 >= *(_DWORD *)(a1 + 20)) {
        return 4294966277;
      }
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)(a1 + 12) = v6 + 1;
      *(unsigned char *)(v7 + v6) = 3;
      int v5 = *(_DWORD *)(a1 + 24) | 0x300;
      *(_DWORD *)(a1 + 24) = v5;
      *(_DWORD *)(a1 + 16) += 8;
    }
    uint64_t v8 = *(int *)(a1 + 12);
    if ((int)v8 >= *(_DWORD *)(a1 + 20)) {
      return 4294966277;
    }
    int v3 = 0;
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)(a1 + 12) = v8 + 1;
    *(unsigned char *)(v9 + v8) = v5;
    *(_DWORD *)(a1 + 8) = 0;
LABEL_12:
    if (!a3) {
      return 0;
    }
  }
}

uint64_t sub_DDBA4(uint64_t a1, int a2, int a3)
{
  if (a2 < 0) {
    a2 = -a2 | 0x80000000;
  }
  return sub_DDAC8(a1, a2, a3);
}

uint64_t sub_DDBBC(uint64_t a1, int a2)
{
  unsigned int v2 = __clz(a2 + 1);
  return sub_DDAC8(a1, (a2 + 1 - (0x80000000 >> v2)) | (0x80000000 >> v2), 63 - 2 * v2);
}

uint64_t sub_DDBE0(uint64_t a1)
{
  uint64_t result = sub_DDA14(a1, 1);
  if (!result)
  {
    int v3 = *(_DWORD *)(a1 + 8);
    if (v3)
    {
      return sub_DDAC8(a1, 0, 8 - v3);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

double sub_DDC48(int a1, uint64_t a2)
{
  int v2 = a1;
  if ((a1 & 0x80000000) == 0)
  {
    if (a2)
    {
      int v3 = *(_DWORD *)(a2 + 8);
      if (v3 >= 1)
      {
        if (!a1) {
          int v2 = 14400000;
        }
        double result = (double)v2 * (double)*(uint64_t *)a2 / (double)v3;
        *(void *)a2 = (uint64_t)result;
        *(_DWORD *)(a2 + 8) = v2;
      }
    }
  }
  return result;
}

uint64_t sub_DDCA0(int a1, uint64_t a2)
{
  uint64_t v2 = 4294966296;
  if (a1 && a2)
  {
    if (14400000 % a1) {
      int v3 = a1;
    }
    else {
      int v3 = 14400000;
    }
    int v4 = *(_DWORD *)(a2 + 8);
    if (v4) {
      uint64_t v5 = (uint64_t)((double)v3 * (double)(*(void *)a2 + v4 / a1) / (double)v4);
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v2 = 0;
    *(void *)a2 = v5;
    *(_DWORD *)(a2 + 8) = v3;
  }
  return v2;
}

uint64_t sub_DDD0C(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, int a5)
{
  *(_OWORD *)__uint64_t v17 = 0u;
  memset(v18, 0, sizeof(v18));
  time_t v16 = 0;
  if (!a4) {
    return 4294966295;
  }
  *a4 = 0;
  setlocale(0, (const char *)&unk_133235);
  time(&v16);
  uint64_t v8 = localtime(&v16);
  strftime(v17, 0x2DuLL, "%Y-%m-%d_%H-%M-%S", v8);
  uint64_t v14 = "/var/mobile/Media/DCIM/";
  if (a1) {
    LOBYTE(v14) = a1;
  }
  sub_DD92C(a4, a5, "%s%s%s%s%s", v9, v10, v11, v12, v13, (char)v14);
  return 0;
}

uint64_t sub_DDE40(uint64_t result)
{
  switch(result)
  {
    case 0xFFFFFC01:
    case 0xFFFFFC02:
    case 0xFFFFFC03:
    case 0xFFFFFC04:
    case 0xFFFFFC05:
    case 0xFFFFFC06:
    case 0xFFFFFC07:
    case 0xFFFFFC08:
    case 0xFFFFFC09:
    case 0xFFFFFC0A:
    case 0xFFFFFC0B:
    case 0xFFFFFC0C:
    case 0xFFFFFC0D:
    case 0xFFFFFC0E:
    case 0xFFFFFC0F:
    case 0xFFFFFC10:
    case 0xFFFFFC11:
    case 0xFFFFFC12:
    case 0xFFFFFC13:
    case 0xFFFFFC14:
    case 0xFFFFFC16:
    case 0xFFFFFC18:
      goto LABEL_2;
    case 0xFFFFFC15:
      double result = 4294954392;
      break;
    case 0xFFFFFC17:
      double result = 4294954394;
      break;
    default:
      if (result == -2001)
      {
        double result = 4294947942;
      }
      else if (result)
      {
LABEL_2:
        double result = 4294949605;
      }
      break;
  }
  return result;
}

__uint64_t sub_DDEFC()
{
  return clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) / 0x3E8;
}

uint64_t sub_DDF34()
{
  v1.tv_sec = 0;
  v1.tv_nsec = 0;
  clock_gettime(_CLOCK_REALTIME, &v1);
  return (v1.tv_nsec + 1000000000 * v1.tv_sec) / 1000;
}

uint64_t sub_DDF8C(int a1)
{
  uint64_t v1 = 0;
  while (dword_15137C[v1] != a1)
  {
    v1 += 2;
    if (v1 == 52) {
      return 3758097084;
    }
  }
  return dword_15137C[v1 + 1];
}

uint64_t sub_DDFC8(int a1)
{
  uint64_t v1 = 0;
  while (dword_15137C[v1 + 1] != a1)
  {
    v1 += 2;
    if (v1 == 52) {
      return 4294966296;
    }
  }
  return dword_15137C[v1];
}

uint64_t sub_DE000(_DWORD *a1, int a2, uint64_t a3, _DWORD *a4)
{
  LODWORD(v4) = *a4;
  if (*a1 >= *a4) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = *a1;
  }
  if ((int)v4 < 1)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = 0;
    uint64_t v6 = a1 + 2;
    do
    {
      if ((a2 & ~*v6) == 0) {
        *(_DWORD *)(a3 + 4 * v5++) = *(v6 - 1);
      }
      v6 += 2;
      --v4;
    }
    while (v4);
  }
  *a4 = v5;
  return 0;
}

uint64_t sub_DE058(CFMutableArrayRef theArray)
{
  for (uint64_t i = 0; i != 8; ++i)
    CFArrayAppendValue(theArray, (const void *)qword_160918[i]);
  CFArrayAppendValue(theArray, kCVImageBufferTransferFunction_UseGamma);
  return 0;
}

uint64_t sub_DE0BC(__CFDictionary *a1)
{
  if (a1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableArrayRef v3 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    uint64_t v4 = v3;
    if (Mutable) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (sub_D1C38(0xD2u, 4))
      {
        int v6 = sub_D1C7C(0xD2u);
        __uint64_t v7 = sub_DDEFC();
        uint64_t v8 = (const char *)sub_D1CB0(4);
        if (v6)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to create CF %p %p %p\n", v7, 210, v8, "AVE_VUI_AddAllColorPrimToCFDict", 161, "pTmpDict != __null && pTmpArray != __null", a1, Mutable, v4);
          __uint64_t v9 = sub_DDEFC();
          time_t v16 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CF %p %p %p", v9, 210, v16);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CF %p %p %p", v7, 210, v8);
        }
      }
      uint64_t v14 = 4294966293;
      if (!Mutable) {
        goto LABEL_22;
      }
    }
    else
    {
      CFDictionarySetValue(Mutable, kVTPropertyTypeKey, kVTPropertyType_Enumeration);
      CFDictionarySetValue(Mutable, kVTPropertyReadWriteStatusKey, kVTPropertyReadWriteStatus_ReadWrite);
      CFDictionarySetValue(Mutable, kVTPropertyShouldBeSerializedKey, kCFBooleanFalse);
      for (uint64_t i = 0; i != 6; ++i)
        CFArrayAppendValue(v4, (const void *)qword_1608E8[i]);
      CFDictionarySetValue(Mutable, kVTPropertySupportedValueListKey, v4);
      CFDictionarySetValue(a1, kVTCompressionPropertyKey_ColorPrimaries, Mutable);
      uint64_t v14 = 0;
      if (!Mutable)
      {
LABEL_22:
        if (v4) {
          CFRelease(v4);
        }
        return v14;
      }
    }
    CFRelease(Mutable);
    goto LABEL_22;
  }
  if (sub_D1C38(0xD2u, 4))
  {
    int v10 = sub_D1C7C(0xD2u);
    __uint64_t v11 = sub_DDEFC();
    uint64_t v12 = (const char *)sub_D1CB0(4);
    if (v10)
    {
      printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p\n", v11, 210, v12, "AVE_VUI_AddAllColorPrimToCFDict", 154, "pDict != __null", 0);
      __uint64_t v11 = sub_DDEFC();
      sub_D1CB0(4);
    }
    syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p", v11);
  }
  return 4294966295;
}

uint64_t sub_DE3C0(__CFDictionary *a1)
{
  if (a1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableArrayRef v3 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    uint64_t v4 = v3;
    if (Mutable) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (sub_D1C38(0xD2u, 4))
      {
        int v6 = sub_D1C7C(0xD2u);
        __uint64_t v7 = sub_DDEFC();
        uint64_t v8 = (const char *)sub_D1CB0(4);
        if (v6)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to create CF %p %p %p\n", v7, 210, v8, "AVE_VUI_AddAllTransCharToCFDict", 209, "pTmpDict != __null && pTmpArray != __null", a1, Mutable, v4);
          __uint64_t v9 = sub_DDEFC();
          int v15 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CF %p %p %p", v9, 210, v15);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CF %p %p %p", v7, 210, v8);
        }
      }
      uint64_t v13 = 4294966293;
      if (!Mutable) {
        goto LABEL_19;
      }
    }
    else
    {
      CFDictionarySetValue(Mutable, kVTPropertyTypeKey, kVTPropertyType_Enumeration);
      CFDictionarySetValue(Mutable, kVTPropertyReadWriteStatusKey, kVTPropertyReadWriteStatus_ReadWrite);
      CFDictionarySetValue(Mutable, kVTPropertyShouldBeSerializedKey, kCFBooleanFalse);
      sub_DE058(v4);
      CFDictionarySetValue(Mutable, kVTPropertySupportedValueListKey, v4);
      CFDictionarySetValue(a1, kVTCompressionPropertyKey_TransferFunction, Mutable);
      uint64_t v13 = 0;
    }
    CFRelease(Mutable);
LABEL_19:
    if (v4) {
      CFRelease(v4);
    }
    return v13;
  }
  if (sub_D1C38(0xD2u, 4))
  {
    int v10 = sub_D1C7C(0xD2u);
    __uint64_t v11 = sub_DDEFC();
    uint64_t v12 = (const char *)sub_D1CB0(4);
    if (v10)
    {
      printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p\n", v11, 210, v12, "AVE_VUI_AddAllTransCharToCFDict", 202, "pDict != __null", 0);
      __uint64_t v11 = sub_DDEFC();
      sub_D1CB0(4);
    }
    syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p", v11);
  }
  return 4294966295;
}

uint64_t sub_DE6A4(__CFDictionary *a1)
{
  if (a1)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableArrayRef v3 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    uint64_t v4 = v3;
    if (Mutable) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      if (sub_D1C38(0xD2u, 4))
      {
        int v6 = sub_D1C7C(0xD2u);
        __uint64_t v7 = sub_DDEFC();
        uint64_t v8 = (const char *)sub_D1CB0(4);
        if (v6)
        {
          printf("%lld %d AVE %s: %s:%d %s | fail to create CF %p %p %p\n", v7, 210, v8, "AVE_VUI_AddAllMatrixCoeffToCFDict", 256, "pTmpDict != __null && pTmpArray != __null", a1, Mutable, v4);
          __uint64_t v9 = sub_DDEFC();
          time_t v16 = sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CF %p %p %p", v9, 210, v16);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | fail to create CF %p %p %p", v7, 210, v8);
        }
      }
      uint64_t v14 = 4294966293;
      if (!Mutable) {
        goto LABEL_22;
      }
    }
    else
    {
      CFDictionarySetValue(Mutable, kVTPropertyTypeKey, kVTPropertyType_Enumeration);
      CFDictionarySetValue(Mutable, kVTPropertyReadWriteStatusKey, kVTPropertyReadWriteStatus_ReadWrite);
      CFDictionarySetValue(Mutable, kVTPropertyShouldBeSerializedKey, kCFBooleanFalse);
      for (uint64_t i = 0; i != 6; ++i)
        CFArrayAppendValue(v4, (const void *)qword_160958[i]);
      CFDictionarySetValue(Mutable, kVTPropertySupportedValueListKey, v4);
      CFDictionarySetValue(a1, kVTCompressionPropertyKey_YCbCrMatrix, Mutable);
      uint64_t v14 = 0;
      if (!Mutable)
      {
LABEL_22:
        if (v4) {
          CFRelease(v4);
        }
        return v14;
      }
    }
    CFRelease(Mutable);
    goto LABEL_22;
  }
  if (sub_D1C38(0xD2u, 4))
  {
    int v10 = sub_D1C7C(0xD2u);
    __uint64_t v11 = sub_DDEFC();
    uint64_t v12 = (const char *)sub_D1CB0(4);
    if (v10)
    {
      printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p\n", v11, 210, v12, "AVE_VUI_AddAllMatrixCoeffToCFDict", 249, "pDict != __null", 0);
      __uint64_t v11 = sub_DDEFC();
      sub_D1CB0(4);
    }
    syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p", v11);
  }
  return 4294966295;
}

uint64_t sub_DE9A8(__CFDictionary *a1)
{
  if (a1)
  {
    int v2 = sub_DE0BC(a1);
    int v3 = sub_DE3C0(a1) + v2;
    return v3 + sub_DE6A4(a1);
  }
  else
  {
    if (sub_D1C38(0xD2u, 4))
    {
      int v5 = sub_D1C7C(0xD2u);
      __uint64_t v6 = sub_DDEFC();
      __uint64_t v7 = (const char *)sub_D1CB0(4);
      if (v5)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p\n", v6, 210, v7, "AVE_VUI_AddAllToCFDict", 294, "pDict != __null", 0);
        __uint64_t v6 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p", v6);
    }
    return 4294966295;
  }
}

void sub_DEAD0()
{
  qword_1608E8 = (uint64_t)kCVImageBufferColorPrimaries_ITU_R_709_2;
  unk_1608F0 = kCVImageBufferColorPrimaries_EBU_3213;
  qword_1608F8 = (uint64_t)kCVImageBufferColorPrimaries_SMPTE_C;
  unk_160900 = kCVImageBufferColorPrimaries_ITU_R_2020;
  qword_160908 = (uint64_t)kCVImageBufferColorPrimaries_P3_D65;
  unk_160910 = kCVImageBufferColorPrimaries_DCI_P3;
  qword_160918 = (uint64_t)kCVImageBufferTransferFunction_ITU_R_709_2;
  unk_160920 = kCVImageBufferTransferFunction_SMPTE_240M_1995;
  qword_160928 = (uint64_t)kCVImageBufferTransferFunction_Linear;
  unk_160930 = kCVImageBufferTransferFunction_sRGB;
  qword_160938 = (uint64_t)kCVImageBufferTransferFunction_ITU_R_2020;
  unk_160940 = kCVImageBufferTransferFunction_SMPTE_ST_2084_PQ;
  qword_160948 = (uint64_t)kCVImageBufferTransferFunction_SMPTE_ST_428_1;
  unk_160950 = kCVImageBufferTransferFunction_ITU_R_2100_HLG;
  qword_160958 = kCVImageBufferYCbCrMatrix_Identity;
  unk_160960 = kCVImageBufferYCbCrMatrix_ITU_R_709_2;
  qword_160968 = (uint64_t)kCVImageBufferYCbCrMatrix_ITU_R_601_4;
  unk_160970 = kCVImageBufferYCbCrMatrix_SMPTE_240M_1995;
  qword_160978 = (uint64_t)kCVImageBufferYCbCrMatrix_ITU_R_2020;
  unk_160980 = kCVImageBufferYCbCrMatrix_ITU_R_2100_ICtCp;
}

uint64_t sub_DEC04(int a1, int a2)
{
  if (-6 * a2 + 48 <= a1 && a1 <= 51) {
    return 0;
  }
  else {
    return 4294966295;
  }
}

uint64_t sub_DEC28(int *a1, int a2)
{
  int v2 = -6 * a2 + 48;
  int v3 = a1[1];
  if (v2 <= *a1 && *a1 <= 51) {
    int v5 = 0;
  }
  else {
    int v5 = -1001;
  }
  if (v2 <= v3 && v3 <= 51) {
    int v7 = 0;
  }
  else {
    int v7 = -1001;
  }
  return (v7 + v5);
}

uint64_t sub_DEC60(int a1, double a2)
{
  if (a2 >= 0.0 && (double)(6 * a1 + 3) >= a2) {
    return 0;
  }
  else {
    return 4294966295;
  }
}

uint64_t sub_DEC90(double *a1, unsigned int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  memset(v16, 0, sizeof(v16));
  sub_3444(a4, a5, (char *)v16, 32, a5, a6, a7, a8);
  if (sub_D1C38(a2, (char)a3))
  {
    int v11 = sub_D1C7C(a2);
    int v12 = v11;
    if (a3 < 0)
    {
      if (v11 && (-a3 & 0x20) == 0) {
        printf("DRL %s | %p %d | %f %f - %f %f\n", (const char *)v16, a1, *((_DWORD *)a1 + 8), *a1, a1[1], a1[2], a1[3]);
      }
      syslog(3, "DRL %s | %p %d | %f %f - %f %f");
    }
    else
    {
      __uint64_t v13 = sub_DDEFC();
      uint64_t v14 = (const char *)sub_D1CB0((char)a3);
      if ((a3 & 0x20) != 0 || !v12)
      {
        syslog(3, "%lld %d AVE %s: DRL %s | %p %d | %f %f - %f %f");
      }
      else
      {
        printf("%lld %d AVE %s: DRL %s | %p %d | %f %f - %f %f\n", v13, a2, v14, (const char *)v16, a1, *((_DWORD *)a1 + 8), *a1, a1[1], a1[2], a1[3]);
        sub_DDEFC();
        sub_D1CB0((char)a3);
        syslog(3, "%lld %d AVE %s: DRL %s | %p %d | %f %f - %f %f");
      }
    }
  }
  return 0;
}

uint64_t sub_DEE74(CFArrayRef theArray, void *a2)
{
  uint64_t v15 = 0;
  double v16 = 0.0;
  if (theArray && a2)
  {
    a2[4] = 0;
    *(_OWORD *)a2 = 0u;
    *((_OWORD *)a2 + 1) = 0u;
    int Count = CFArrayGetCount(theArray);
    int v5 = Count >> 1;
    if (Count >= 2)
    {
      CFIndex v6 = 0;
      if (v5 <= 1) {
        unsigned int v7 = 1;
      }
      else {
        unsigned int v7 = Count >> 1;
      }
      uint64_t v8 = 2 * v7;
      do
      {
        if (sub_C2E14(theArray, v6, &v16))
        {
          uint64_t result = sub_C2B6C(theArray, v6, &v15);
          if (result) {
            return result;
          }
          double v10 = (double)v15;
        }
        else
        {
          double v10 = v16;
        }
        *(double *)&a2[v6] = v10;
        if (sub_C2E14(theArray, v6 + 1, &v16))
        {
          uint64_t result = sub_C2B6C(theArray, v6 + 1, &v15);
          if (result) {
            return result;
          }
          double v11 = (double)v15;
        }
        else
        {
          double v11 = v16;
        }
        *(double *)&a2[v6 + 1] = v11;
        v6 += 2;
      }
      while (v8 != v6);
    }
    uint64_t result = 0;
    *((_DWORD *)a2 + 8) = v5;
  }
  else
  {
    if (sub_D1C38(0x35u, 4))
    {
      int v12 = sub_D1C7C(0x35u);
      __uint64_t v13 = sub_DDEFC();
      uint64_t v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p\n", v13, 53, v14, "AVE_DRL_Retrieve", 52, "pArray != __null && pDRL != __null", theArray, a2);
        __uint64_t v13 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p", v13, 53);
    }
    return 4294966295;
  }
  return result;
}

uint64_t sub_DF05C(int *a1, __CFArray *a2)
{
  if (a1 && a2)
  {
    if (a1[8] < 1)
    {
      return 0;
    }
    else
    {
      uint64_t v4 = 0;
      for (uint64_t i = (double *)(a1 + 2); ; i += 2)
      {
        int v6 = sub_C1EF4(a2, *(i - 1));
        uint64_t result = sub_C1EF4(a2, *i) + v6;
        if (result) {
          break;
        }
        if (++v4 >= a1[8]) {
          return 0;
        }
      }
    }
  }
  else
  {
    if (sub_D1C38(0x35u, 4))
    {
      int v8 = sub_D1C7C(0x35u);
      __uint64_t v9 = sub_DDEFC();
      double v10 = (const char *)sub_D1CB0(4);
      if (v8)
      {
        printf("%lld %d AVE %s: %s:%d %s | wrong parameter %p %p\n", v9, 53, v10, "AVE_DRL_Make", 119, "pDRL != __null && pArray != __null", a1, a2);
        __uint64_t v9 = sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | wrong parameter %p %p", v9, 53);
    }
    return 4294966295;
  }
  return result;
}

int *sub_DF1CC(int a1)
{
  uint64_t v1 = 0;
  while (dword_154438[v1] != a1)
  {
    v1 += 3;
    if (v1 == 24) {
      return 0;
    }
  }
  return &dword_154438[v1];
}

uint64_t sub_DF200(uint64_t result, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, unsigned int a8, char a9, int a10)
{
  uint64_t v42 = result;
  v64[128] = 4;
  v64[129] = a6;
  int v65 = 1 << (a6 - 1);
  uint64_t v66 = 0x1000000001;
  long long v67 = 0u;
  long long v68 = 0u;
  v60[64] = 4;
  v60[65] = a6;
  v60[66] = v65;
  uint64_t v61 = 0x1000000001;
  if (a6 <= 8) {
    int v10 = 3;
  }
  else {
    int v10 = 4;
  }
  int v39 = v10;
  long long v62 = 0uLL;
  long long v63 = 0uLL;
  v56[64] = 4;
  v56[65] = a6;
  v56[66] = 1 << (a6 - 1);
  uint64_t v57 = 0x1000000001;
  long long v58 = 0uLL;
  long long v59 = 0uLL;
  if (a5 >= 1)
  {
    uint64_t v37 = 0;
    unsigned int v36 = 0;
    unsigned int v48 = 0;
    if (a6 == 8) {
      char v11 = 1;
    }
    else {
      char v11 = 2;
    }
    if (a7) {
      uint64_t v12 = 8;
    }
    else {
      uint64_t v12 = 16;
    }
    int v13 = -1 << a6;
    if (!a7) {
      char v11 = a6 != 8;
    }
    unsigned int v14 = a8 >> v11;
    if (a7) {
      char v15 = 3;
    }
    else {
      char v15 = 4;
    }
    int v35 = 16 * v14;
    char v41 = v15;
    if (a7) {
      int v16 = 8;
    }
    else {
      int v16 = 4;
    }
    unsigned int v38 = v16;
    int v17 = ~v13;
    int v46 = 2 * v14;
    unsigned int v47 = v14;
    uint64_t v34 = 8 * v14;
    int v40 = ~v13;
    do
    {
      if (a4 < 1) {
        goto LABEL_59;
      }
      int v18 = 0;
      uint64_t v19 = v37;
      unsigned int v20 = v36;
      do
      {
        unsigned int v21 = *(_DWORD *)(v42
                        + (v48 >> 3 >> a9) * a10
                        + 4 * ((v18 >> v41 << a9) + (~(-1 << a9) & (v48 >> 3))));
        __uint64_t v22 = (unsigned __int8 *)(a2 + (v21 & 0xFFFFFFF));
        __uint64_t v70 = v22;
        uint64_t v71 = 0;
        unint64_t v69 = 0;
        if (v21 >> 28)
        {
          uint64_t result = sub_DF6D0((uint64_t)&v69, v39, v38, (uint64_t)v72, 128, 16);
        }
        else
        {
          uint64_t v23 = 0;
          int v24 = 0;
          unsigned int v25 = 0;
          do
          {
            v24 -= a6;
            HIDWORD(v69) = v24;
            if (v24 < 0)
            {
              do
              {
                __uint64_t v26 = v22 + 1;
                __uint64_t v70 = v22 + 1;
                unsigned int v25 = *v22 | (v25 << 8);
                v24 += 8;
                unint64_t v69 = __PAIR64__(v24, v25);
                ++v22;
              }
              while (v24 >= 8);
            }
            else
            {
              __uint64_t v26 = v22;
            }
            v72[v23++] = (v25 >> v24) & v17;
            __uint64_t v22 = v26;
          }
          while (v23 != 128);
        }
        LODWORD(v27) = 0;
        int v28 = 0;
        uint64_t v45 = v19;
        int v50 = v19;
        unsigned int v44 = v20;
        do
        {
          uint64_t v29 = 0;
          unsigned int v49 = v20;
          do
          {
            BOOL v31 = (int)(v28 + v48) < a5 && v18 + (int)v29 < a4;
            int v32 = v72[(int)v27];
            if (a7)
            {
              if (v21 >> 28)
              {
                uint64_t result = sub_DF9BC(v60, v28, v29, v32);
                LOWORD(v32) = result;
              }
              if (v31)
              {
                if (a6 == 8) {
                  *(unsigned char *)(a3 + v20) = v32;
                }
                else {
                  *(_WORD *)(a3 + 2 * v20) = v32;
                }
              }
              uint64_t v27 = (int)v27 + 1;
              int v32 = v72[v27];
              if (v21 >> 28)
              {
                uint64_t result = sub_DF9BC(v56, v28, v29, v32);
                LOWORD(v32) = result;
              }
              if (v31)
              {
                uint64_t v33 = v20 + 1;
LABEL_53:
                if (a6 == 8) {
                  *(unsigned char *)(a3 + v33) = v32;
                }
                else {
                  *(_WORD *)(a3 + 2 * v33) = v32;
                }
              }
            }
            else
            {
              if (v21 >> 28)
              {
                uint64_t result = sub_DF8F0(v64, v28, v29, v32);
                LOWORD(v32) = result;
              }
              if (v31)
              {
                uint64_t v33 = (v50 + v29);
                goto LABEL_53;
              }
            }
            LODWORD(v27) = v27 + 1;
            ++v29;
            v20 += 2;
          }
          while (v12 != v29);
          ++v28;
          unsigned int v20 = v49 + v46;
          v50 += v47;
        }
        while (v28 != 8);
        v18 += v12;
        int v17 = v40;
        unsigned int v20 = v44 + 2 * v12;
        uint64_t v19 = v45 + v12;
      }
      while (v18 < a4);
LABEL_59:
      v36 += v35;
      v37 += v34;
      v48 += 8;
    }
    while ((int)v48 < a5);
  }
  return result;
}

uint64_t sub_DF664(uint64_t a1, int a2)
{
  unsigned int v2 = *(_DWORD *)a1;
  int v3 = *(_DWORD *)(a1 + 4) - a2;
  *(_DWORD *)(a1 + 4) = v3;
  if (v3 < 0)
  {
    int v6 = *(unsigned __int8 **)(a1 + 8);
    unint64_t v5 = *(void *)(a1 + 16);
    do
    {
      unsigned int v7 = v6 + 1;
      *(void *)(a1 + 8) = v6 + 1;
      if (v5 && (unint64_t)v6 >= v5) {
        int v8 = 0;
      }
      else {
        int v8 = *v6;
      }
      unsigned int v2 = v8 | (v2 << 8);
      char v4 = v3 + 8;
      *(_DWORD *)a1 = v2;
      *(_DWORD *)(a1 + 4) = v3 + 8;
      int v6 = v7;
      BOOL v9 = v3 < -8;
      v3 += 8;
    }
    while (v9);
  }
  else
  {
    char v4 = v3;
  }
  return (v2 >> v4) & ~(-1 << a2);
}

uint64_t sub_DF6D0(uint64_t a1, int a2, unsigned int a3, uint64_t a4, int a5, int a6)
{
  if (*(_DWORD *)(a1 + 4)) {
    sub_E58A8();
  }
  uint64_t v8 = *(void *)(a1 + 8);
  int v33 = a5 - 1;
  if (a5 >= 1)
  {
    int v10 = a3;
    uint64_t v30 = *(void *)(a1 + 8);
    int v11 = 0;
    int v12 = 0;
    int v13 = a6 + 1;
    int v35 = -a3;
    uint64_t v36 = a3;
    int v31 = a6 + 1;
    do
    {
      int v14 = sub_DF664(a1, a2) + 2;
      if (v14 >= v13) {
        int v15 = v13;
      }
      else {
        int v15 = v14;
      }
      if (v10 >= 1)
      {
        uint64_t v16 = 0;
        BOOL v17 = v14 > v13;
        if (v12 <= a5) {
          int v18 = a5;
        }
        else {
          int v18 = v12;
        }
        uint64_t v19 = (v18 - v12);
        unsigned int v20 = (_DWORD *)(a4 + 4 * v12);
        do
        {
          if (v19 == v16) {
            break;
          }
          _DWORD *v20 = sub_DF664(a1, v15);
          if ((~(_BYTE)v16 & 3) == 0)
          {
            if (v17 || (unint64_t v21 = *(void *)(a1 + 16)) != 0 && *(void *)(a1 + 8) > v21)
            {
              BOOL v17 = 0;
              _DWORD *v20 = 0;
              *((void *)v20 - 1) = 0;
              *(v20 - 3) = 0;
            }
            else
            {
              BOOL v17 = 0;
            }
          }
          ++v16;
          ++v20;
        }
        while (v36 != v16);
        uint64_t v22 = 0;
        int v10 = a3;
        int v23 = v33;
        int v13 = v31;
        int v24 = v35;
        do
        {
          int v25 = v22 + v12;
          if ((int)v22 + v12 >= a5) {
            break;
          }
          if (v11)
          {
            uint64_t v26 = v22 + v12;
            if ((int)(v22 + v12 + a3 + a3 * (*(_DWORD *)(a4 + 4 * v26) & 0x1F)) >= a5) {
              unsigned int v27 = v23 - v12;
            }
            else {
              unsigned int v27 = a3 + a3 * (*(_DWORD *)(a4 + 4 * v26) & 0x1F);
            }
            *(_DWORD *)(a4 + 4 * v26) = 0;
            if (v27)
            {
              bzero((void *)(a4 + 4 * ((int)v22 + v12 + 1)), 4 * v27);
              v12 += v27;
              int v25 = v22 + v12;
            }
            int v24 = v35;
          }
          if (*(_DWORD *)(a4 + 4 * v25) == 1)
          {
            int v11 = 0;
            BOOL v28 = v24 + v22 == -2 || a3 == 1;
            if (v28 && v25 + 2 < a5)
            {
              *(_DWORD *)(a4 + 4 * v25) = 0;
              int v11 = 1;
            }
          }
          else
          {
            int v11 = 0;
          }
          ++v22;
          --v23;
        }
        while (v24 + v22);
      }
      v12 += v10;
    }
    while (v12 < a5);
    LODWORD(v8) = v30;
    if (*(int *)(a1 + 4) >= 8) {
      sub_E587C();
    }
  }
  *(_DWORD *)(a1 + 4) = 0;
  return (*(_DWORD *)(a1 + 8) - v8);
}

uint64_t sub_DF8F0(_DWORD *a1, int a2, int a3, int a4)
{
  if (a1[131])
  {
    int v8 = sub_DFA88(a1, a2, a3);
  }
  else
  {
    BOOL v9 = a1 + 130;
    if (a2 >= 1) {
      BOOL v9 = &a1[16 * (unint64_t)(a2 - 1) + a3];
    }
    if (a3 >= 1) {
      BOOL v9 = &a1[16 * (uint64_t)a2 + (a3 - 1)];
    }
    int v8 = *v9;
    a1[133] = *v9;
  }
  int v10 = a4 >> 1;
  if (a4) {
    int v10 = -v10;
  }
  a1[139] = v10;
  int v11 = v8 + v10;
  if (v11 < 0 || v11 >> a1[129]) {
    a1[140] = 1;
  }
  uint64_t result = v11 & ~(-1 << a1[132]);
  a1[16 * (uint64_t)a2 + a3] = result;
  return result;
}

uint64_t sub_DF9BC(_DWORD *a1, int a2, int a3, int a4)
{
  if (a1[67])
  {
    int v8 = sub_DFB90(a1, a2, a3);
  }
  else
  {
    BOOL v9 = a1 + 66;
    if (a2 >= 1) {
      BOOL v9 = &a1[8 * (a2 - 1) + a3];
    }
    if (a3 >= 1) {
      BOOL v9 = &a1[8 * a2 + a3 - 1];
    }
    int v8 = *v9;
    a1[69] = *v9;
  }
  int v10 = a4 >> 1;
  if (a4) {
    int v10 = -v10;
  }
  a1[75] = v10;
  int v11 = v8 + v10;
  if (v11 < 0 || v11 >> a1[65]) {
    a1[76] = 1;
  }
  uint64_t result = v11 & ~(-1 << a1[68]);
  a1[8 * a2 + a3] = result;
  return result;
}

uint64_t sub_DFA88(_DWORD *a1, int a2, int a3)
{
  if (a2)
  {
    if (a3 % a1[128])
    {
      int v3 = a1[138] + a1[139];
      a1[138] = v3;
      signed int v4 = a1[136];
      signed int v5 = a1[137];
    }
    else
    {
      if (a3 <= 0)
      {
        uint64_t v9 = (a2 - 2);
        uint64_t v10 = (a2 - 1);
        if (a2 <= 1)
        {
          uint64_t v10 = (int)v10;
          uint64_t v9 = (int)v10;
        }
        signed int v5 = a1[16 * v9 + a3];
        a1[134] = v5;
        int v8 = &a1[16 * v10 + a3];
      }
      else
      {
        int v8 = &a1[16 * (uint64_t)a2 + (a3 - 1)];
        signed int v5 = *(v8 - 16);
        a1[134] = v5;
      }
      int v11 = *v8;
      a1[133] = *v8;
      int v3 = v11 - v5;
      if (v11 >= v5) {
        signed int v4 = v5;
      }
      else {
        signed int v4 = v11;
      }
      a1[136] = v4;
      if (v11 > v5) {
        signed int v5 = v11;
      }
      a1[137] = v5;
      a1[138] = v3;
    }
    int v12 = a1[16 * (uint64_t)a2 - 16 + a3];
    a1[135] = v12;
    if (v12 < v4) {
      signed int v4 = v12;
    }
    a1[136] = v4;
    if (v12 > v5) {
      signed int v5 = v12;
    }
    a1[137] = v5;
    int v13 = v3 + v12;
    if (v13 < v5) {
      signed int v5 = v13;
    }
    if (v13 >= v4) {
      return v5;
    }
    else {
      return v4;
    }
  }
  else
  {
    int v6 = &a1[a3 - 1];
    if (a3 <= 0) {
      int v6 = a1 + 130;
    }
    uint64_t v7 = *v6;
    a1[133] = v7;
  }
  return v7;
}

uint64_t sub_DFB90(_DWORD *a1, int a2, int a3)
{
  if (a2)
  {
    if (a3 % a1[64])
    {
      int v3 = a1[74] + a1[75];
      a1[74] = v3;
      signed int v4 = a1[72];
      signed int v5 = a1[73];
    }
    else
    {
      if (a3 <= 0)
      {
        uint64_t v9 = (a2 - 2);
        uint64_t v10 = (a2 - 1);
        if (a2 <= 1)
        {
          uint64_t v10 = (int)v10;
          uint64_t v9 = (int)v10;
        }
        signed int v5 = a1[8 * v9 + a3];
        a1[70] = v5;
        int v8 = &a1[8 * v10 + a3];
      }
      else
      {
        int v8 = &a1[8 * a2 + a3 - 1];
        signed int v5 = *(v8 - 8);
        a1[70] = v5;
      }
      int v11 = *v8;
      a1[69] = *v8;
      int v3 = v11 - v5;
      if (v11 >= v5) {
        signed int v4 = v5;
      }
      else {
        signed int v4 = v11;
      }
      a1[72] = v4;
      if (v11 > v5) {
        signed int v5 = v11;
      }
      a1[73] = v5;
      a1[74] = v3;
    }
    int v12 = a1[8 * a2 - 8 + a3];
    a1[71] = v12;
    if (v12 < v4) {
      signed int v4 = v12;
    }
    a1[72] = v4;
    if (v12 > v5) {
      signed int v5 = v12;
    }
    a1[73] = v5;
    int v13 = v3 + v12;
    if (v13 < v5) {
      signed int v5 = v13;
    }
    if (v13 >= v4) {
      return v5;
    }
    else {
      return v4;
    }
  }
  else
  {
    int v6 = &a1[a3 - 1];
    if (a3 <= 0) {
      int v6 = a1 + 66;
    }
    uint64_t v7 = *v6;
    a1[69] = v7;
  }
  return v7;
}

BOOL sub_DFC98(int a1, unsigned int a2)
{
  unsigned int v2 = a1 - 1;
  BOOL result = 0;
  if (a2 || v2 >= 2)
  {
    BOOL v3 = a2 == 6 || a2 == 8;
    BOOL v4 = v3;
    if (a1 != 2 || !v4)
    {
      BOOL v5 = a2 != 25 && a2 - 9 >= 2;
      BOOL v6 = !v5;
      if ((a1 != 3 || !v6) && (a2 > 0x1A || ((1 << a2) & 0x4C00000) == 0 || v2 >= 2)) {
        return 1;
      }
    }
  }
  return result;
}

uint64_t sub_DFD10(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, uint64_t a8, unsigned int a9, int a10, unsigned int a11, int a12, int a13)
{
  if (a7) {
    uint64_t v13 = 16;
  }
  else {
    uint64_t v13 = 32;
  }
  uint64_t v107 = v13;
  if ((a6 | 2) != 0xA) {
    sub_E58D4();
  }
  if (a7) {
    int v19 = 8;
  }
  else {
    int v19 = 1;
  }
  if (a7) {
    int v20 = 10;
  }
  else {
    int v20 = 3;
  }
  if (a7) {
    char v21 = 4;
  }
  else {
    char v21 = 5;
  }
  char v94 = v21;
  if (a6 == 8) {
    unsigned int v22 = v19;
  }
  else {
    unsigned int v22 = v20;
  }
  unsigned int v89 = dword_154B60[28 * v22 + 4 + a13];
  uint64_t result = sub_E1B10((uint64_t)v114, v22, a13, 0);
  memset(v115, 0, 512);
  unsigned int v24 = a11 + a5;
  if (a11 + a5)
  {
    unsigned int v99 = 0;
    unsigned int v25 = (v107 - 1 + a4) >> v94;
    unsigned int v26 = (v107 - 1 + a5) >> v94;
    unsigned int v27 = 32 - __clz(v26 - 1);
    if (v26 >= 2) {
      unsigned int v28 = v27;
    }
    else {
      unsigned int v28 = 0;
    }
    unsigned int v29 = 32 - __clz(v25 - 1);
    unsigned int v78 = (v107 - 1 + a4) >> v94;
    if (v25 < 2) {
      unsigned int v29 = 0;
    }
    unsigned int v30 = a9 + a4;
    if (v29 >= v28) {
      uint64_t v31 = v28;
    }
    else {
      uint64_t v31 = v29;
    }
    char v32 = 5;
    if (a7) {
      char v32 = 3;
    }
    char v86 = v32;
    char v87 = 2 * v31;
    uint64_t v76 = &dword_154B60[28 * v22 + 8 + a13];
    v77 = &dword_1557A0[11 * v22 + 7];
    uint64_t v83 = (v31 + 1) & 0x1FFFFFFFELL;
    uint64x2_t v82 = (uint64x2_t)vdupq_n_s64(v31 - 1);
    uint64_t v98 = (4 * a4);
    uint64_t v79 = (v107 * a4);
    int8x16_t v33 = (int8x16_t)vdupq_n_s64(1uLL);
    int64x2_t v34 = vdupq_n_s64(2uLL);
    uint64_t v81 = -a9 - a4 * a11;
    int v80 = -(2 * a4 * a11 + 2 * a9);
    int v97 = 8 * a4;
    int v35 = 2 * a4;
    int v36 = a4;
    int64x2_t v84 = v34;
    int8x16_t v85 = v33;
    int v88 = v31;
    unsigned int v104 = v24;
    do
    {
      if (!v30) {
        goto LABEL_74;
      }
      uint64_t v37 = 0;
      unint64_t v38 = v99 >> v94;
      int v93 = v38 * v78;
      int v106 = ~(-1 << *v77);
      unsigned int v105 = *v76;
      uint64x2_t v39 = (uint64x2_t)vdupq_n_s64(v38);
      int v40 = v80;
      uint64_t v41 = v81;
      uint64x2_t v92 = v39;
      do
      {
        unint64_t v42 = v37 >> v94;
        if (v31)
        {
          uint64x2_t v43 = (uint64x2_t)vdupq_n_s64(v42);
          int8x16_t v44 = 0uLL;
          uint64_t v45 = v83;
          int64x2_t v46 = (int64x2_t)xmmword_143760;
          do
          {
            int8x16_t v47 = v44;
            int64x2_t v48 = v46;
            uint64x2_t v49 = (uint64x2_t)vnegq_s64(v46);
            int8x16_t v50 = (int8x16_t)vaddq_s64(v48, v48);
            int8x16_t v44 = vorrq_s8(vorrq_s8((int8x16_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v43, v49), v33), (uint64x2_t)v50), (int8x16_t)vshlq_u64((uint64x2_t)vandq_s8((int8x16_t)vshlq_u64(v39, v49), v33), (uint64x2_t)vorrq_s8(v50, v33))), v47);
            int64x2_t v46 = vaddq_s64(v46, v34);
            v45 -= 2;
          }
          while (v45);
          int8x16_t v51 = vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)v48, v82), v47, v44);
          int8x8_t v52 = vorr_s8(*(int8x8_t *)v51.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v51, v51, 8uLL));
        }
        else
        {
          int8x8_t v52 = 0;
        }
        int v53 = 0;
        __uint64_t v54 = (char *)(a2 + (v42 + v93) * v89);
        CFIndex v55 = (unsigned char *)(a1 + ((*(void *)&v52 | ((v42 | (v99 >> v94)) >> v31 << v87)) << v86));
        int v96 = v40;
        uint64_t v95 = v41;
        uint64_t v100 = v37;
        do
        {
          int v56 = 0;
          int v103 = v53;
          int v57 = v53 + v99;
          int v102 = v40;
          int v58 = v40;
          uint64_t v101 = v41;
          do
          {
            int v110 = v58;
            int v111 = v56;
            v112 = v55;
            v113 = v54;
            uint64_t v59 = *v55;
            int v109 = v59 & 0xF0;
            if (*v55) {
              unsigned int v60 = (v59 & v106) + 1;
            }
            else {
              unsigned int v60 = 0;
            }
            unsigned int v108 = v60;
            uint64_t result = sub_E02D0((uint64_t)v114, v54, v59, (uint64_t)v115);
            unsigned int v24 = v104;
            uint64_t v61 = 0;
            unsigned int v62 = v110;
            int v63 = v41;
            int v64 = (int *)&v115[4];
            do
            {
              uint64_t v65 = 0;
              BOOL v67 = v57 + (int)v61 >= a11 && v57 + (int)v61 < v104;
              unsigned int v68 = v62;
              unint64_t v69 = v64;
              do
              {
                BOOL v70 = (int)v37 + (int)v65 >= a9 && v67;
                if ((int)v37 + (int)v65 < v30 && v70)
                {
                  int v72 = *(v69 - 1);
                  if (a7)
                  {
                    uint64_t result = v68;
                    uint64_t v73 = v68 + 1;
                    if (a6 == 8)
                    {
                      *(unsigned char *)(a3 + v68) = v72;
                      int v72 = *v69;
LABEL_60:
                      *(unsigned char *)(a3 + v73) = v72;
                      goto LABEL_63;
                    }
                    *(_WORD *)(a3 + 2 * v68) = v72;
                    int v72 = *v69;
                  }
                  else
                  {
                    uint64_t v73 = (v63 + v65);
                    if (a6 == 8) {
                      goto LABEL_60;
                    }
                  }
                  *(_WORD *)(a3 + 2 * v73) = v72;
                }
LABEL_63:
                ++v65;
                v69 += 4;
                v68 += 2;
              }
              while (v65 != 8);
              ++v61;
              v64 += 32;
              v63 += v36;
              v62 += v35;
            }
            while (v61 != 4);
            if (v109 != 240 || a13 == 0) {
              uint64_t v75 = v108;
            }
            else {
              uint64_t v75 = v105;
            }
            __uint64_t v54 = &v113[v75];
            CFIndex v55 = v112 + 1;
            int v56 = v111 + 8;
            LODWORD(v41) = v41 + 8;
            int v58 = v110 + 16;
            LODWORD(v37) = v37 + 8;
          }
          while (v111 + 8 < v107);
          int v53 = v103 + 4;
          LODWORD(v37) = v100;
          uint64_t v41 = v101 + v98;
          int v40 = v102 + v97;
        }
        while (v103 + 4 < v107);
        uint64_t v37 = v100 + v107;
        uint64_t v41 = v95 + v107;
        int v40 = v96 + 2 * v107;
        LODWORD(v31) = v88;
        int64x2_t v34 = v84;
        int8x16_t v33 = v85;
        uint64x2_t v39 = v92;
      }
      while ((int)v100 + (int)v107 < v30);
LABEL_74:
      v81 += v79;
      v80 += 2 * v79;
      v99 += v107;
    }
    while (v99 < v24);
  }
  return result;
}

uint64_t sub_E02D0(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = (_DWORD *)a1;
  unsigned int v8 = dword_1557A0[11 * *(unsigned int *)(a1 + 340) + 7];
  if ((*(_DWORD *)(a1 + 348) - 1) <= 2)
  {
    unsigned int v9 = sub_E1BE8(a1, a3);
    int v10 = v7[85];
    if (v9 > dword_154B60[28 * v10 + 8 + v7[87]]
      || v9 < sub_E1BE8((uint64_t)v7, LOBYTE(dword_1557A0[11 * v10 + 8])))
    {
      goto LABEL_233;
    }
    if ((~a3 & 0xF0) == 0)
    {
      uint64_t v11 = v7[87];
      if ((v11 - 1) <= 2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v7[85];
        unint64_t v177 = (unint64_t)dword_154B60[28 * v13 + 8 + v11] >> 2;
        int16x8_t v14 = (int16x8_t)vtstq_s32(vdupq_n_s32(a3), (int32x4_t)xmmword_14DE70);
        *(int8x8_t *)v14.i8 = vand_s8((int8x8_t)vmovn_s32((int32x4_t)v14), (int8x8_t)0x1000100010001);
        unsigned __int32 v196 = vmovn_s16(v14).u32[0];
        uint64_t v175 = a4;
        v176 = a2;
        v174 = v7;
        while (1)
        {
          uint64_t v15 = v7[87];
          uint64_t v178 = v12;
          uint64_t v16 = &a2[v12 * v177];
          int v17 = v7[88];
          uint64_t v187 = v13;
          int v195 = v17;
          if (!v197[v12 - 4]) {
            break;
          }
          uint64_t v18 = 0;
          unsigned int v19 = dword_154B60[28 * v13 + 8 + v15] >> 2;
          v215 = v16;
          int v214 = v19;
          char v218 = 1;
          unsigned int v217 = 0;
          unsigned int v216 = 8 * v19;
          int v20 = &dword_155C70[13 * v13];
          LODWORD(v21) = v20[2];
          unsigned int v22 = v17 & 0xFFFFFFFE;
          if (v21 <= 1) {
            uint64_t v21 = 1;
          }
          else {
            uint64_t v21 = v21;
          }
          v181 = v20 + 3;
          uint64_t v184 = v21;
          v179 = &dword_154B60[28 * v13 + 12 + 4 * v15];
          int v23 = (unsigned int *)v197;
          do
          {
            uint64_t v192 = v18;
            unsigned int v25 = v179;
            unsigned int v24 = v181;
            v188 = v23;
            uint64_t v26 = v184;
            if (v13 != 27)
            {
              do
              {
                int v28 = *v25++;
                int v27 = v28;
                int v30 = *v24++;
                int v29 = v30;
                int v31 = -1 << v30;
                if (v30 == 32) {
                  unsigned int v32 = -1;
                }
                else {
                  unsigned int v32 = ~v31;
                }
                int v33 = 1 << (v29 - 1);
                unsigned int v34 = (sub_E1DBC((uint64_t)v213, v29 - v27) << v27) & v32;
                BOOL v36 = v22 != 2 || v34 != v33;
                if (v34 >> v27 == v32 >> v27) {
                  int v37 = v32;
                }
                else {
                  int v37 = ((1 << (v27 - 1)) - ((v34 >> v27) & 1)) | v34;
                }
                if (!v36 || v34 == 0) {
                  unsigned int v39 = v34;
                }
                else {
                  unsigned int v39 = v37;
                }
                if (!v27) {
                  unsigned int v39 = v34;
                }
                if (v195 != 1) {
                  unsigned int v34 = v39;
                }
                if (v22 == 2) {
                  int v40 = v33;
                }
                else {
                  int v40 = 0;
                }
                *v23++ = v34 ^ v40;
                --v26;
              }
              while (v26);
            }
            uint64_t v18 = v192 + 1;
            uint64_t v13 = v187;
            int v23 = v188 + 4;
          }
          while (v192 != 7);
          a4 = v175;
          a2 = v176;
          uint64_t v7 = v174;
LABEL_193:
          uint64_t v139 = 0;
          v140 = v197;
          do
          {
            if (v7[85] == 27)
            {
              uint64_t v13 = 27;
            }
            else
            {
              unint64_t v141 = 0;
              uint32x4_t v142 = (uint32x4_t)vdupq_n_s32((int)v139 + 8 * (int)v178);
              v143.i64[0] = 0x100000001;
              v143.i64[1] = 0x100000001;
              int8x16_t v144 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v142, (uint32x4_t)xmmword_1544A0), v143), (uint32x4_t)xmmword_1544B0);
              int8x16_t v145 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v142, (uint32x4_t)xmmword_1544C0), v143), (uint32x4_t)xmmword_1544B0);
              unint64_t v146 = a4
                   + ((unint64_t)(vorr_s8(*(int8x8_t *)v144.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v144, v144, 8uLL)).u32[0] | v144.i32[1]) << 7)
                   + 16
                   * (vorr_s8(*(int8x8_t *)v145.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v145, v145, 8uLL)).u32[0] | v145.i32[1]);
              do
              {
                *(_DWORD *)(v146 + 4 * v141) = *(_DWORD *)&v140[4 * v141];
                ++v141;
                uint64_t v13 = v7[85];
              }
              while (v141 < dword_155C70[13 * v13 + 2]);
            }
            ++v139;
            v140 += 16;
          }
          while (v139 != 8);
          uint64_t v12 = v178 + 1;
          if (v178 == 3) {
            return 1;
          }
        }
        int v193 = 0;
        v185 = &dword_155C70[13 * v13];
        unsigned int v182 = v185[2];
        int v172 = v7[87];
        unsigned int v41 = dword_154B60[28 * v13 + 8 + v15];
        v215 = &a2[v12 * v177];
        v41 *= 2;
        int v214 = (v41 >> 3) & 0x7FFFFFF;
        char v218 = 1;
        unsigned int v217 = 0;
        unsigned int v180 = v41;
        unsigned int v216 = v41 & 0x3FFFFFF8;
        if (v13 == 27)
        {
LABEL_42:
          uint64_t v210 = 0;
          uint64_t v211 = 0;
          uint64_t v208 = 0;
          uint64_t v209 = 0;
          v207[0] = sub_E15F4(v185[3]);
          unint64_t v42 = (int *)&dword_155C70[13 * v187];
          v207[1] = sub_E15F4(v42[4]);
          v207[2] = sub_E15F4(v42[5]);
          v207[3] = sub_E15F4(v42[6]);
          unsigned int v43 = v182;
          sub_E16A4(v182, (uint64_t)v207, (uint64_t)v220, (uint64_t)&v210, (uint64_t)&v208);
          uint64_t v205 = 0;
          uint64_t v206 = 0;
          uint64_t v203 = 0;
          uint64_t v204 = 0;
          if (v187 == 27)
          {
            uint64_t v201 = 0;
            uint64_t v202 = 0;
            uint64_t v199 = 0;
            uint64_t v200 = 0;
            int v44 = v195;
            int v45 = v193;
          }
          else
          {
            unint64_t v73 = 0;
            uint64_t v191 = (v172 - 1);
            if (v182 <= 1) {
              uint64_t v74 = 1;
            }
            else {
              uint64_t v74 = v182;
            }
            uint64_t v173 = v74;
            uint64_t v186 = 4 * v74;
            do
            {
              unsigned int v75 = dword_155C70[13 * v187 + 3 + v73 / 4];
              uint64_t v76 = sub_E15F4(v75);
              int v77 = v220[v73 / 4];
              unsigned int v78 = &dword_156378[160 * v76 + 10 * v77];
              int v79 = dword_156330[3 * v76 + v191];
              int v80 = v78[5];
              *(_DWORD *)((char *)&v205 + v73) = v79 + v78[4];
              uint64_t v81 = (unsigned int *)((char *)&v203 + v73);
              *(_DWORD *)((char *)&v203 + v73) = v80 + v79;
              sub_E1A88(v76, v77, *(_DWORD *)((char *)&v210 + v73), *(_DWORD *)((char *)&v208 + v73), (uint64_t *)((char *)&v205 + v73), (uint64_t *)((char *)&v203 + v73));
              unsigned int v82 = *(_DWORD *)((char *)&v205 + v73);
              if (v75 < v82) {
                unsigned int v82 = v75;
              }
              *(_DWORD *)((char *)&v205 + v73) = v82;
              if (v80) {
                unsigned int v83 = v75;
              }
              else {
                unsigned int v83 = 0;
              }
              if (v83 >= *v81) {
                unsigned int v83 = *v81;
              }
              unsigned int *v81 = v83;
              v73 += 4;
            }
            while (v186 != v73);
            if (v187 == 19 && v221 == 1 && HIDWORD(v209) - HIDWORD(v211) <= 1)
            {
              uint64_t v205 = 0;
              uint64_t v206 = 0;
              uint64_t v203 = 0;
              uint64_t v204 = 0;
            }
            uint64_t v84 = v173;
            int8x16_t v85 = &dword_155C70[13 * v187 + 3];
            char v86 = &v201;
            uint64_t v201 = 0;
            uint64_t v202 = 0;
            char v87 = v219;
            int v88 = (unsigned int *)&v205;
            unsigned int v89 = (int *)v220;
            do
            {
              int v90 = *v89++;
              if (v90 || *v85 - 8 > 4)
              {
                unsigned int v91 = *v88;
                *(_DWORD *)char v86 = sub_E1DBC((uint64_t)v213, *v88) << (*v85 - v91);
                v193 += v91;
              }
              else
              {
                *(_DWORD *)char v86 = *v87;
              }
              char v86 = (uint64_t *)((char *)v86 + 4);
              ++v87;
              ++v85;
              ++v88;
              --v84;
            }
            while (v84);
            uint64_t v199 = 0;
            uint64_t v200 = 0;
            uint64x2_t v92 = &v199;
            int v93 = &v203;
            int v44 = v195;
            int v45 = v193;
            unsigned int v43 = v182;
            uint64_t v94 = v173;
            do
            {
              int v95 = *(_DWORD *)v93;
              int v93 = (uint64_t *)((char *)v93 + 4);
              if (v95)
              {
                int v96 = sub_E2B20((uint64_t)v213, v217, 3u);
                v217 += 3;
                *(_DWORD *)uint64x2_t v92 = v96;
                v45 += 3;
              }
              uint64x2_t v92 = (uint64_t *)((char *)v92 + 4);
              --v94;
            }
            while (v94);
          }
          unsigned int v97 = (v180 & 0x3FFFFFFE) - v45;
          unsigned int v98 = v97 / 7;
          unsigned int v99 = v217 + v97 - 7 * (v97 / 7);
          unsigned int v217 = v99;
          unsigned int v100 = v216;
          if (v99 > v216) {
            sub_E5900();
          }
          LODWORD(v101) = v43;
          uint64_t v102 = 0;
          unsigned int v194 = v44 & 0xFFFFFFFE;
          memset(&v198[1], 0, 96);
          if (v101 <= 1) {
            uint64_t v101 = 1;
          }
          else {
            uint64_t v101 = v101;
          }
          uint64_t v183 = v101;
          int v103 = v198;
          v198[0] = 0uLL;
          uint64_t v104 = v187;
          do
          {
            if (v104 == 27)
            {
              unsigned int v105 = 0;
            }
            else
            {
              unsigned int v105 = 0;
              int v106 = (unsigned int *)&v203;
              uint64_t v107 = v103;
              uint64_t v108 = v183;
              do
              {
                unsigned int v110 = *v106++;
                unsigned int v109 = v110;
                if (v110)
                {
                  *uint64_t v107 = sub_E1DBC((uint64_t)v213, v109);
                  v105 += v109;
                }
                v107 += 7;
                --v108;
              }
              while (v108);
              if (v105 > v98) {
                sub_E5958();
              }
              unsigned int v99 = v217;
              unsigned int v100 = v216;
              uint64_t v104 = v187;
            }
            v99 += v98 - v105;
            unsigned int v217 = v99;
            if (v99 > v100) {
              sub_E5900();
            }
            ++v102;
            int v103 = (_OWORD *)((char *)v103 + 4);
          }
          while (v102 != 7);
          if (v104 != 27)
          {
            uint64_t v111 = 0;
            v112 = v197;
            do
            {
              int v113 = dword_155C70[13 * v104 + 3 + v111];
              int v114 = sub_E15F4(v113);
              uint64_t v115 = 0;
              unsigned int v116 = 0;
              unint64_t v117 = *(void *)&dword_156378[160 * v114 + 2 + 10 * v220[v111]];
              int v118 = *((_DWORD *)&v203 + v111);
              unint64_t v119 = v117 >> v118;
              if (v117 >> v118 <= 1) {
                unint64_t v119 = 1;
              }
              if (v119 >> 1 >= (unint64_t)(1 << (v113
                                                         - *((_DWORD *)&v205 + v111))) >> 1)
                unint64_t v120 = (unint64_t)(1 << (v113 - *((_DWORD *)&v205 + v111))) >> 1;
              else {
                unint64_t v120 = v119 >> 1;
              }
              unint64_t v121 = (1 << (v113 - 1));
              uint64_t v122 = *((unsigned int *)&v201 + v111);
              unint64_t v123 = ~(-1 << v118);
              unint64_t v124 = v117 + v122;
              unint64_t v125 = 1 << v113;
              if (!v122) {
                unint64_t v120 = 0;
              }
              if (v113 == 16) {
                unint64_t v126 = 31744;
              }
              else {
                unint64_t v126 = 2139095040;
              }
              if (v113 == 16) {
                unint64_t v127 = 64512;
              }
              else {
                unint64_t v127 = 4286578688;
              }
              if (v113 == 16) {
                unint64_t v128 = 32256;
              }
              else {
                unint64_t v128 = 2143289344;
              }
              unint64_t v129 = 4290772992;
              if (v113 == 16) {
                unint64_t v129 = 65024;
              }
              v130 = v112;
              do
              {
                if (v118)
                {
                  if (v115 == *((_DWORD *)&v199 + v111))
                  {
                    unint64_t v131 = v120;
                    BOOL v132 = v122 == v121;
                  }
                  else
                  {
                    unint64_t v133 = *((unsigned int *)v198 + 7 * v111 + v116);
                    BOOL v132 = (v121 - v122) / v119 == v133;
                    if (v133 > v123) {
                      sub_E592C();
                    }
                    if (v133 | v122)
                    {
                      if (v124 < v125 || (unint64_t v131 = v125 - 1, v133 != v123)) {
                        unint64_t v131 = (v119 >> 1) + v119 * v133;
                      }
                    }
                    else
                    {
                      unint64_t v131 = 0;
                    }
                    ++v116;
                  }
                }
                else
                {
                  unint64_t v131 = 0;
                  BOOL v132 = v119 > v121 - v122;
                }
                unint64_t v134 = v131 + v122;
                unint64_t v135 = v134;
                if (v195 == 1)
                {
                  if (v134 < v126 || (unint64_t v135 = (v126 - 1), v134 >= v128))
                  {
                    if (v134 < v128 || (unint64_t v135 = v121, v134 >= v121))
                    {
                      BOOL v136 = v134 < v129 && v134 >= v127;
                      unint64_t v135 = (v127 - 1);
                      if (!v136) {
                        unint64_t v135 = v134;
                      }
                    }
                  }
                }
                if (v135 >= v125) {
                  int v137 = v125 - 1;
                }
                else {
                  int v137 = v135;
                }
                if (v132) {
                  int v138 = 0;
                }
                else {
                  int v138 = v137 ^ v121;
                }
                if (v194 != 2) {
                  int v138 = v137;
                }
                _DWORD *v130 = v138;
                v130 += 4;
                ++v115;
              }
              while (v115 != 8);
              ++v111;
              v112 += 4;
              uint64_t v104 = v187;
            }
            while (v111 != v183);
          }
          a2 = v176;
          goto LABEL_193;
        }
        int v46 = 0;
        if (v182 <= 1) {
          uint64_t v47 = 1;
        }
        else {
          uint64_t v47 = v182;
        }
        int64x2_t v48 = &dword_155C70[13 * v13 + 3];
        uint64x2_t v49 = v212;
        int8x16_t v50 = v48;
        uint64_t v189 = v47;
        do
        {
          int v52 = *v50++;
          int v51 = v52;
          if (v52 == 2)
          {
            unsigned int v53 = 1;
          }
          else if ((v51 - 8) >= 5)
          {
            unsigned int v53 = 4;
            if (v51 != 16 && v51 != 32) {
              sub_E59B0();
            }
          }
          else
          {
            unsigned int v53 = 3;
          }
          *v49++ = sub_E1DBC((uint64_t)v213, v53);
          v46 += v53;
          --v47;
        }
        while (v47);
        int v193 = v46;
        uint64_t v54 = 0;
        CFIndex v55 = (int *)v220;
        int v56 = v219;
        int v57 = (int *)v212;
        uint64_t v58 = v189;
        while (1)
        {
          unsigned int v60 = *v48++;
          unsigned int v59 = v60;
          if (v60 == 2)
          {
            char v61 = *v57;
            *int v56 = 0;
            int v62 = v61 & 1;
            int v63 = v55;
LABEL_95:
            *int v63 = v62;
            goto LABEL_96;
          }
          v190 = v48;
          uint64_t v64 = v58;
          BOOL v65 = v59 - 8 < 5 || v59 == 16;
          if (!v65 && v59 != 32) {
            sub_E5984();
          }
          int v66 = *v57;
          unsigned int v67 = v59 & 0xFFFFFFFD;
          if (((v59 & 0xFFFFFFFD) == 8 || v59 == 12) && v66 == 0)
          {
            char v70 = sub_E2B20((uint64_t)v213, v217, 2u);
            v217 += 2;
            v193 += 2;
            int v63 = (int *)&v220[v54];
            *int v56 = 0;
            *CFIndex v55 = 0;
            int v62 = v70 & 3;
            if (v67 == 8)
            {
              uint64_t v58 = v64;
              if (v62 != 2)
              {
                int64x2_t v48 = v190;
                if (v62 == 1)
                {
                  int v62 = 0;
                  *int v56 = ~(-1 << v59);
                  goto LABEL_95;
                }
                if ((v70 & 3) != 0)
                {
                  int v62 = 2;
                  goto LABEL_95;
                }
                int v63 = v55;
                uint64_t v71 = v56;
                goto LABEL_94;
              }
              int v62 = 1;
LABEL_90:
              int64x2_t v48 = v190;
              goto LABEL_95;
            }
            uint64_t v58 = v64;
            if (v59 == 12)
            {
              int64x2_t v48 = v190;
              if (v62 == 2 || v62 == 1) {
                goto LABEL_95;
              }
              if ((v70 & 3) != 0)
              {
                int v62 = 3;
                goto LABEL_95;
              }
              uint64_t v71 = v56;
              int v63 = v55;
              goto LABEL_94;
            }
          }
          else
          {
            int v63 = (int *)&v220[v54];
            *int v56 = 0;
            if (v59 > 0xF)
            {
              int v62 = v66 & 0xF;
              goto LABEL_90;
            }
            uint64_t v71 = &v219[v54];
            int v72 = v66 & 7;
            *CFIndex v55 = v72;
            if (v67 == 8)
            {
              if (!v72)
              {
                int64x2_t v48 = v190;
                goto LABEL_94;
              }
              int v62 = v72 + 2;
              goto LABEL_90;
            }
            if (v59 == 12)
            {
              int64x2_t v48 = v190;
              if (v72)
              {
                int v62 = v72 + 3;
                goto LABEL_95;
              }
LABEL_94:
              int v62 = 0;
              int *v71 = 0;
              goto LABEL_95;
            }
          }
          int64x2_t v48 = v190;
LABEL_96:
          ++v54;
          ++v55;
          ++v56;
          ++v57;
          if (!--v58) {
            goto LABEL_42;
          }
        }
      }
    }
  }
  uint64_t v147 = v7[85];
  if (dword_1557A0[11 * v147 + 8] == a3)
  {
    int v148 = (a3 & ~(-1 << dword_1557A0[11 * v147 + 7])) + 1;
    v215 = a2;
    int v214 = v148 << (v147 == 26);
    char v218 = 1;
    unsigned int v217 = 0;
    unsigned int v216 = 8 * v214;
    if (v147 == 27)
    {
      int v149 = 27;
    }
    else
    {
      unint64_t v158 = 0;
      do
      {
        *(_DWORD *)(a4 + 4 * v158) = sub_E1DBC((uint64_t)v213, dword_155C70[13 * v147 + 3 + v158]);
        ++v158;
        uint64_t v147 = v7[85];
      }
      while (v158 < dword_155C70[13 * v147 + 2]);
      int v149 = v7[85];
    }
    uint64_t v159 = 0;
    for (uint64_t i = 0; i != 4; ++i)
    {
      uint64_t v161 = 0;
      uint64_t v162 = v159;
      do
      {
        if (v149 == 27)
        {
          int v149 = 27;
        }
        else
        {
          unint64_t v163 = 0;
          do
          {
            *(_DWORD *)(a4 + v162 + 4 * v163) = *(_DWORD *)(a4 + 4 * v163);
            ++v163;
            int v149 = v7[85];
          }
          while (v163 < dword_155C70[13 * v149 + 2]);
        }
        ++v161;
        v162 += 16;
      }
      while (v161 != 8);
      v159 += 128;
    }
    return 1;
  }
  if (dword_1557A0[11 * v147 + 9] == a3)
  {
    unsigned int v150 = 0;
    unsigned int v151 = dword_1557A0[11 * v147 + 5];
    v215 = a2;
    int v214 = v151;
    char v218 = 1;
    unsigned int v217 = 0;
    unsigned int v216 = 8 * v151;
    do
    {
      if (v147 != 27)
      {
        unint64_t v152 = 0;
        uint32x4_t v153 = (uint32x4_t)vdupq_n_s32(v150);
        v154.i64[0] = 0x100000001;
        v154.i64[1] = 0x100000001;
        int8x16_t v155 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v153, (uint32x4_t)xmmword_1544C0), v154), (uint32x4_t)xmmword_1544B0);
        int8x16_t v156 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v153, (uint32x4_t)xmmword_1544A0), v154), (uint32x4_t)xmmword_1544B0);
        unint64_t v157 = a4
             + ((unint64_t)(vorr_s8(*(int8x8_t *)v156.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v156, v156, 8uLL)).u32[0] | v156.i32[1]) << 7)
             + 16
             * (vorr_s8(*(int8x8_t *)v155.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v155, v155, 8uLL)).u32[0] | v155.i32[1]);
        do
        {
          *(_DWORD *)(v157 + 4 * v152) = sub_E1DBC((uint64_t)v213, dword_155C70[13 * v147 + 3 + v152]);
          ++v152;
          uint64_t v147 = v7[85];
        }
        while (v152 < dword_155C70[13 * v147 + 2]);
      }
      ++v150;
    }
    while (v150 != 32);
    if (v7[87]) {
      sub_E59DC();
    }
    return 1;
  }
  if (dword_1557A0[11 * v147 + 10] == a3)
  {
    for (unsigned int j = 0; j != 32; ++j)
    {
      uint32x4_t v166 = (uint32x4_t)vdupq_n_s32(j);
      v167.i64[0] = 0x100000001;
      v167.i64[1] = 0x100000001;
      int8x16_t v168 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v166, (uint32x4_t)xmmword_1544C0), v167), (uint32x4_t)xmmword_1544B0);
      int8x16_t v169 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v166, (uint32x4_t)xmmword_1544A0), v167), (uint32x4_t)xmmword_1544B0);
      sub_E1E04((uint64_t)&dword_155C70[13 * v147], a2, a4+ ((unint64_t)(vorr_s8(*(int8x8_t *)v169.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v169, v169, 8uLL)).u32[0] | v169.i32[1]) << 7)+ 16 * (vorr_s8(*(int8x8_t *)v168.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v168, v168, 8uLL)).u32[0] | v168.i32[1]));
      uint64_t v147 = v7[85];
      a2 += dword_155C70[13 * v147 + 1];
    }
    if (v7[87]) {
      sub_E5A08();
    }
    return 1;
  }
  unsigned int v170 = ((a3 & ~(-1 << v8)) + 1) << (v147 == 26);
  unsigned int v171 = dword_1557A0[11 * v147 + 5];
  v215 = a2;
  if (v171 >= v170) {
    unsigned int v171 = v170;
  }
  int v214 = v171;
  char v218 = 1;
  unsigned int v217 = 0;
  unsigned int v216 = 8 * v171;
  if (sub_E1EE8((uint64_t)v7, (uint64_t)a2, a3, (uint64_t)v213))
  {
    sub_E22C4(v7, (uint64_t)a2, a3, (uint64_t)v213, a4);
    sub_E29F8(v7, a4);
    return 1;
  }
LABEL_233:
  sub_E1CD4((uint64_t)v7, a4);
  return 0;
}

uint64_t sub_E1364(unsigned int *a1, unsigned int a2, int a3, unsigned int a4)
{
  unsigned int v6 = a3 + 4 * a2;
  uint64_t result = sub_E146C(a1, a2, a3);
  a1[3 * v6 + 1] = result;
  if ((unint64_t)a4 >> result) {
    sub_E5A34();
  }
  unsigned int v8 = &a1[3 * v6];
  v8[2] = a4;
  v8[3] = 1;
  return result;
}

uint64_t sub_E13C4(unsigned int *a1)
{
  int v2 = *a1;
  uint64_t v3 = dword_1544D0[15 * *a1 + 14];
  for (unsigned int i = 3; i != 7; ++i)
  {
    if (v2 == 27)
    {
      int v2 = 27;
    }
    else
    {
      unsigned int v5 = 0;
      do
      {
        uint64_t v3 = sub_E146C(a1, i, v5++) + v3;
        int v2 = *a1;
      }
      while (v5 < dword_155C70[13 * *a1 + 2]);
    }
  }
  return v3;
}

uint64_t sub_E146C(unsigned int *a1, unsigned int a2, int a3)
{
  if (a2 <= 1) {
    return dword_1544D0[15 * *a1 + 1 + 4 * a2 + a3];
  }
  if (a2 == 4)
  {
    if (!a1[3 * a3 + 3]) {
      sub_E5AE4();
    }
    if (!a1[3 * (a3 + 4) + 3]) {
      sub_E5B10();
    }
    if ((a1[3 * a3 + 2] & 8) != 0) {
      return a1[3 * (a3 + 4) + 2] + 1;
    }
    return 0;
  }
  if (a2 != 3)
  {
    if (a2 == 2) {
      return dword_155C70[13 * *a1 + 3 + a3];
    }
    if (a2 - 5 > 1) {
      sub_E5A8C();
    }
    if (!a1[3 * a3 + 3]) {
      sub_E5A60();
    }
    if ((a1[3 * a3 + 2] & 3) == 2) {
      return dword_155C70[13 * *a1 + 3 + a3] >> 1;
    }
    return 0;
  }
  if (!a1[3 * a3 + 3]) {
    sub_E5AB8();
  }
  if ((a1[3 * a3 + 2] & 4) == 0) {
    return 0;
  }
  if (dword_155C70[13 * *a1 + 3 + a3] == 32) {
    return 16;
  }
  else {
    return 8;
  }
}

uint64_t sub_E15F4(int a1)
{
  int v2 = a1 - 8;
  uint64_t result = 0;
  switch(v2)
  {
    case 0:
      return result;
    case 1:
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_5;
    case 2:
      uint64_t result = 1;
      break;
    case 4:
      uint64_t result = 2;
      break;
    case 8:
      uint64_t result = 3;
      break;
    default:
      if (a1 == 32)
      {
        uint64_t result = 4;
      }
      else
      {
LABEL_5:
        if (a1 == 2) {
          uint64_t result = 5;
        }
        else {
          uint64_t result = 6;
        }
        if ((a1 | 2) != 2) {
          sub_E5B3C(a1);
        }
      }
      break;
  }
  return result;
}

uint64_t sub_E16A4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v5 = *(_DWORD *)(a2 + 12);
  if (v5 == 5)
  {
    unsigned int v6 = *(_DWORD *)(a3 + 12);
    if (v6 >= 2) {
      sub_E5BA8();
    }
    if (v6) {
      int v7 = 8;
    }
    else {
      int v7 = 5;
    }
    *(_DWORD *)(a3 + 12) = v7;
    *(_DWORD *)(a2 + 12) = 1;
  }
  if (!result)
  {
    unsigned int v9 = 0;
    unsigned int v10 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = 0;
  unsigned int v9 = 0;
  unsigned int v10 = 0;
  unsigned int v11 = 0;
  unsigned int v12 = -1;
  do
  {
    unsigned int v13 = *(_DWORD *)(a3 + 4 * v8);
    if (v13 > v11 || v8 == 1 && v13 == v11)
    {
      unsigned int v11 = *(_DWORD *)(a3 + 4 * v8);
      unsigned int v10 = v8;
    }
    if (v13 < v12)
    {
      unsigned int v12 = *(_DWORD *)(a3 + 4 * v8);
      unsigned int v9 = v8;
    }
    int v14 = dword_156378[160 * *(unsigned int *)(a2 + 4 * v8) + 6 + 10 * v13];
    *(_DWORD *)(a5 + 4 * v8) = v14;
    *(_DWORD *)(a4 + 4 * v8++) = v14;
  }
  while (result != v8);
  if (result != 1)
  {
LABEL_19:
    unsigned int v15 = (v10 + 1) % 3;
    if (v15 == v9) {
      unsigned int v15 = (v10 + 2) % 3;
    }
    unsigned int v16 = *(_DWORD *)(a3 + 4 * v15);
    unsigned int v17 = *(_DWORD *)(a3 + 4 * (int)(6 - (v10 + v9) - v15));
    BOOL v18 = v16 > v17;
    if (v16 <= v17) {
      signed int v19 = v15;
    }
    else {
      signed int v19 = 6 - (v10 + v9) - v15;
    }
    if (v18) {
      signed int v20 = v15;
    }
    else {
      signed int v20 = 6 - (v10 + v9) - v15;
    }
    uint64_t v21 = v10;
    int v22 = *(_DWORD *)(a3 + 4 * v10);
    uint64_t v23 = v9;
    unsigned int v24 = *(_DWORD *)(a3 + 4 * v9);
    if (result == 2)
    {
      if (v22 == v24 || *(int *)(a4 + 4 * v9) < 1)
      {
LABEL_52:
        if (v5 == 5)
        {
          *(_DWORD *)(a2 + 12) = 5;
          *(_DWORD *)(a3 + 12) = *(_DWORD *)(a3 + 12) != 5;
          if (*(int *)(a4 + 12) >= 1) {
            sub_E5B7C();
          }
        }
        return result;
      }
      *(_DWORD *)(a5 + 4 * v9) = 0;
      int v25 = *(_DWORD *)(a4 + 4 * v9);
      int v26 = *(_DWORD *)(a5 + 4 * v21);
      goto LABEL_31;
    }
    uint64_t v28 = v19;
    int v29 = *(_DWORD *)(a3 + 4 * v19);
    uint64_t v30 = v20;
    if ((v22 - v29) <= 1 && v24 <= 1)
    {
      *(_DWORD *)(a5 + 4 * v23) = 0;
      unint64_t v35 = 1431655766 * *(int *)(a4 + 4 * v23);
      *(_DWORD *)(a5 + 4 * v28) += HIDWORD(v35) + (v35 >> 63);
      unint64_t v36 = 1431655766 * (*(_DWORD *)(a4 + 4 * v23) + 1);
      *(_DWORD *)(a5 + 4 * v20) += HIDWORD(v36) + (v36 >> 63);
      unint64_t v37 = 1431655766 * (*(_DWORD *)(a4 + 4 * v23) + 2);
      int v38 = HIDWORD(v37) + (v37 >> 63);
      int v39 = *(_DWORD *)(a5 + 4 * v21);
LABEL_46:
      int v27 = v38 + v39;
      goto LABEL_51;
    }
    int v32 = *(_DWORD *)(a3 + 4 * v20);
    if ((v22 - v32) <= 1 && v24 <= 1)
    {
      *(_DWORD *)(a5 + 4 * v23) = 0;
      int v40 = *(_DWORD *)(a4 + 4 * v28) & (*(int *)(a4 + 4 * v28) >> 31);
      *(_DWORD *)(a5 + 4 * v28) = v40;
      *(_DWORD *)(a5 + 4 * v30) += (*(_DWORD *)(a4 + 4 * v23) - v40 + *(_DWORD *)(a4 + 4 * v28)) / 2;
      int v41 = *(_DWORD *)(a4 + 4 * v23) + *(_DWORD *)(a4 + 4 * v28) - *(_DWORD *)(a5 + 4 * v28);
      if (v41 + 1 >= 0) {
        int v42 = v41 + 1;
      }
      else {
        int v42 = v41 + 2;
      }
      int v27 = *(_DWORD *)(a5 + 4 * v21) + (v42 >> 1);
      goto LABEL_51;
    }
    if (v32 - v24 > 1)
    {
      if (v32 - v24 != 2) {
        goto LABEL_62;
      }
      int v34 = *(_DWORD *)(a4 + 4 * v21);
    }
    else
    {
      int v34 = *(_DWORD *)(a4 + 4 * v21);
      if ((v34 & 0x80000000) == 0) {
        goto LABEL_62;
      }
      uint64_t result = *(unsigned int *)(a4 + 4 * v30);
      if ((int)result > 0)
      {
LABEL_59:
        int v43 = 0;
        *(_DWORD *)(a5 + 4 * v23) = 0;
        *(_DWORD *)(a5 + 4 * v28) = 0;
        if (*(_DWORD *)(a4 + 4 * v28) + *(_DWORD *)(a4 + 4 * v23) >= 6) {
          int v43 = *(_DWORD *)(a4 + 4 * v30);
        }
        *(_DWORD *)(a5 + 4 * v30) = v43;
        int v38 = *(_DWORD *)(a4 + 4 * v23) - v43 + *(_DWORD *)(a4 + 4 * v28);
        int v39 = *(_DWORD *)(a4 + 4 * v30) + *(_DWORD *)(a5 + 4 * v21);
        goto LABEL_46;
      }
    }
    if (v34 <= -2 && *(int *)(a4 + 4 * v30) >= 1) {
      goto LABEL_59;
    }
LABEL_62:
    if (!v24
      || *(int *)(a4 + 4 * v23) < 1
      || *(int *)(a4 + 4 * v28) < 1
      || (*(_DWORD *)(a4 + 4 * v30) & 0x80000000) != 0
      || *(int *)(a4 + 4 * v21) > -2)
    {
      if (v22 != v24 && *(int *)(a4 + 4 * v23) >= 1)
      {
        *(_DWORD *)(a5 + 4 * v23) = 0;
        *(_DWORD *)(a5 + 4 * v21) += *(_DWORD *)(a4 + 4 * v23);
      }
      if (v32 != v29 && *(int *)(a4 + 4 * v28) >= 1)
      {
        *(_DWORD *)(a5 + 4 * v28) = 0;
        *(_DWORD *)(a5 + 4 * v30) += *(_DWORD *)(a4 + 4 * v28);
      }
      goto LABEL_52;
    }
    *(_DWORD *)(a5 + 4 * v23) = 0;
    *(_DWORD *)(a5 + 4 * v28) = 0;
    *(_DWORD *)(a5 + 4 * v30) = *(_DWORD *)(a4 + 4 * v30);
    int v26 = *(_DWORD *)(a4 + 4 * v28);
    int v25 = *(_DWORD *)(a4 + 4 * v23) + *(_DWORD *)(a5 + 4 * v21);
LABEL_31:
    int v27 = v26 + v25;
LABEL_51:
    *(_DWORD *)(a5 + 4 * v21) = v27;
    goto LABEL_52;
  }
  return result;
}

uint64_t sub_E1A88(uint64_t result, int a2, int a3, int a4, _DWORD *a5, _DWORD *a6)
{
  int v6 = a4 - a3;
  if (a4 - a3 < 0)
  {
    if (dword_156378[160 * result + 7 + 10 * a2] < a3 - a4)
    {
      --*a6;
      if (!dword_156378[160 * result + 8 + 10 * a2])
      {
        int v6 = -1;
        goto LABEL_4;
      }
    }
  }
  else if (a4 != a3)
  {
    *a6 += v6;
LABEL_4:
    *a5 += v6;
  }
  return result;
}

uint64_t sub_E1B10(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  *(_DWORD *)a1 = a2;
  if (dword_1544D0[15 * a2] != a2) {
    sub_E5C2C();
  }
  *(_OWORD *)(a1 + 4) = 0u;
  *(_OWORD *)(a1 + 308) = 0u;
  *(_OWORD *)(a1 + 324) = 0u;
  *(_OWORD *)(a1 + 276) = 0u;
  *(_OWORD *)(a1 + 292) = 0u;
  *(_OWORD *)(a1 + 244) = 0u;
  *(_OWORD *)(a1 + 260) = 0u;
  *(_OWORD *)(a1 + 212) = 0u;
  *(_OWORD *)(a1 + 228) = 0u;
  *(_OWORD *)(a1 + 180) = 0u;
  *(_OWORD *)(a1 + 196) = 0u;
  *(_OWORD *)(a1 + 148) = 0u;
  *(_OWORD *)(a1 + 164) = 0u;
  *(_OWORD *)(a1 + 116) = 0u;
  *(_OWORD *)(a1 + 132) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 100) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 68) = 0u;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_DWORD *)(a1 + 340) = a2;
  *(_DWORD *)(a1 + 348) = a3;
  *(_DWORD *)(a1 + 352) = a4;
  if (!sub_DFC98(a3, a2)) {
    sub_E5C00();
  }
  if (a3 && a4 >= 4) {
    sub_E5BD4();
  }
  *(_DWORD *)(a1 + 344) = LOBYTE(dword_155C70[13 * a2 + 12]);
  return a1;
}

uint64_t sub_E1BE8(uint64_t a1, unsigned int a2)
{
  if (a2 >= 0xF0)
  {
    uint64_t v2 = *(unsigned int *)(a1 + 348);
    if ((v2 - 1) <= 2) {
      return dword_154B60[28 * *(unsigned int *)(a1 + 340) + 8 + v2];
    }
  }
  int v4 = *(_DWORD *)(a1 + 340);
  if (dword_1557A0[11 * v4 + 8] == a2) {
    return ((a2 & ~(-1 << dword_1557A0[11 * v4 + 7])) + 1) << (v4 == 26);
  }
  if (dword_1557A0[11 * v4 + 9] == a2) {
    return dword_1557A0[11 * v4 + 5];
  }
  if (!a2) {
    return 0;
  }
  int v5 = (char *)&dword_1557A0[11 * v4];
  unsigned int v6 = ((a2 & ~(-1 << *((_DWORD *)v5 + 7))) + 1) << (v4 == 26);
  unsigned int v7 = *((_DWORD *)v5 + 5);
  if (v7 >= v6) {
    return v6;
  }
  else {
    return v7;
  }
}

uint64_t sub_E1CD4(uint64_t result, uint64_t a2)
{
  unsigned int v2 = 0;
  v3.i64[0] = 0x100000001;
  v3.i64[1] = 0x100000001;
  do
  {
    uint64_t v4 = *(unsigned int *)(result + 340);
    if (v4 != 27)
    {
      unint64_t v5 = 0;
      uint32x4_t v6 = (uint32x4_t)vdupq_n_s32(v2);
      int8x16_t v7 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v6, (uint32x4_t)xmmword_1544C0), v3), (uint32x4_t)xmmword_1544B0);
      int8x16_t v8 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v6, (uint32x4_t)xmmword_1544A0), v3), (uint32x4_t)xmmword_1544B0);
      uint64_t v9 = a2
         + ((unint64_t)(vorr_s8(*(int8x8_t *)v8.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)).u32[0] | v8.i32[1]) << 7)
         + 16 * (vorr_s8(*(int8x8_t *)v7.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v7, v7, 8uLL)).u32[0] | v7.i32[1]);
      do
      {
        if (v5 == 1) {
          int v10 = 0;
        }
        else {
          int v10 = ~(-1 << dword_155C70[13 * v4 + 3 + v5]);
        }
        *(_DWORD *)(v9 + 4 * v5++) = v10;
        uint64_t v4 = *(unsigned int *)(result + 340);
      }
      while (v5 < dword_155C70[13 * v4 + 2]);
    }
    ++v2;
  }
  while (v2 != 32);
  return result;
}

uint64_t sub_E1DBC(uint64_t a1, unsigned int a2)
{
  if (a2 >= 0x21) {
    sub_E5C58();
  }
  uint64_t result = sub_E2B20(a1, *(_DWORD *)(a1 + 540), a2);
  *(_DWORD *)(a1 + 540) += a2;
  return result;
}

void *sub_E1E04(uint64_t a1, const void *a2, uint64_t a3)
{
  size_t v6 = *(unsigned int *)(a1 + 4);
  if (v6 <= 0xF) {
    size_t v7 = 16 - v6;
  }
  else {
    size_t v7 = 0;
  }
  bzero(&__dst[v6], v7);
  uint64_t result = memcpy(__dst, a2, v6);
  if (*(_DWORD *)(a1 + 8))
  {
    unint64_t v9 = 0;
    do
    {
      *(_DWORD *)(a3 + 4 * v9) = (*(void *)&__dst[((unint64_t)*(unsigned int *)(a1 + 4 * v9 + 28) >> 3) & 0x1FFFFFF8] >> *(_DWORD *)(a1 + 4 * v9 + 28)) & ~(-1 << *(_DWORD *)(a1 + 4 * v9 + 12));
      ++v9;
    }
    while (v9 < *(unsigned int *)(a1 + 8));
  }
  return result;
}

BOOL sub_E1EE8(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  int v4 = *(_DWORD *)(a1 + 340);
  unsigned int v5 = dword_1557A0[11 * v4 + 7];
  unsigned int v6 = 8 - v5;
  unsigned int v7 = dword_1544D0[15 * v4 + 1];
  unsigned int v8 = v7 - (8 - v5);
  if (v7 <= 8 - v5) {
    sub_E5CB0();
  }
  int v10 = *(_DWORD *)(a4 + 512);
  unsigned int v11 = v6 + 8 * v10;
  if (v11 < dword_1544D0[15 * v4 + 14]) {
    return 0;
  }
  unsigned int v14 = v5 - 8;
  int v15 = (a3 >> v5) & ~(-1 << v6);
  int v16 = 8 * v10;
  int v17 = sub_E1DBC(a4, v8);
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 68) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 100) = 0u;
  *(_OWORD *)(a1 + 116) = 0u;
  *(_OWORD *)(a1 + 132) = 0u;
  *(_OWORD *)(a1 + 148) = 0u;
  *(_OWORD *)(a1 + 164) = 0u;
  *(_OWORD *)(a1 + 180) = 0u;
  *(_OWORD *)(a1 + 196) = 0u;
  *(_OWORD *)(a1 + 212) = 0u;
  *(_OWORD *)(a1 + 228) = 0u;
  *(_OWORD *)(a1 + 4) = 0u;
  *(_OWORD *)(a1 + 244) = 0u;
  *(_OWORD *)(a1 + 260) = 0u;
  *(_OWORD *)(a1 + 276) = 0u;
  *(_OWORD *)(a1 + 292) = 0u;
  *(_OWORD *)(a1 + 308) = 0u;
  *(_OWORD *)(a1 + 324) = 0u;
  sub_E1364((unsigned int *)a1, 0, 0, (v17 << v6) | v15);
  for (unsigned int i = 1; i != 28; ++i)
  {
    if (i == 12)
    {
      if (v11 < sub_E13C4((unsigned int *)a1)) {
        return 0;
      }
    }
    else
    {
      if (i != 8)
      {
        unsigned int v19 = i >> 2;
        if (i >> 2 == 6) {
          continue;
        }
        goto LABEL_11;
      }
      sub_E1DBC(a4, dword_1544D0[15 * *(unsigned int *)(a1 + 340) + 13] + v14 - *(_DWORD *)(a4 + 540));
    }
    unsigned int v19 = i >> 2;
LABEL_11:
    unsigned int v20 = sub_E146C((unsigned int *)a1, v19, i & 3);
    unsigned int v21 = sub_E1DBC(a4, v20);
    sub_E1364((unsigned int *)a1, v19, i & 3, v21);
    if (v19 == 5)
    {
      unsigned int v22 = sub_E146C((unsigned int *)a1, 6u, i & 3);
      unsigned int v23 = sub_E1DBC(a4, v22);
      sub_E1364((unsigned int *)a1, 6u, i & 3, v23);
    }
  }
  int v24 = sub_E13C4((unsigned int *)a1);
  sub_E1DBC(a4, v24 + v14 - *(_DWORD *)(a4 + 540));
  int v25 = *(_DWORD *)(a1 + 340);
  if (v25 == 21)
  {
    if (!*(_DWORD *)(a1 + 24)) {
      sub_E5C84();
    }
    if (!*(_DWORD *)(a1 + 36)) {
      sub_E5C84();
    }
    int v26 = *(_DWORD *)(a1 + 20);
    if ((v26 & 0x10) != 0)
    {
      unsigned int v27 = *(_DWORD *)(a1 + 32);
      *(_DWORD *)(a1 + 344) = 2;
      sub_E1364((unsigned int *)a1, 0, 1, v26 & 0xFFFFFFEF | (16 * ((v27 >> 4) & 1)));
      sub_E1364((unsigned int *)a1, 0, 2, v27 & 0xFFFFFFEF);
      int v25 = *(_DWORD *)(a1 + 340);
    }
    else
    {
      int v25 = 21;
    }
  }
  uint64_t v28 = 0;
  int v29 = 0;
  uint64_t v30 = &dword_155C70[13 * v25];
  LODWORD(v31) = v30[2];
  if (v31 <= 1) {
    uint64_t v31 = 1;
  }
  else {
    uint64_t v31 = v31;
  }
  int v32 = v30 + 3;
  do
  {
    if (v25 != 27)
    {
      uint64_t v33 = 0;
      int v34 = (_DWORD *)(a1 + 12);
      unint64_t v35 = (_DWORD *)(a1 + 12);
      do
      {
        int v36 = *v35;
        v35 += 3;
        if (!v36) {
          sub_E5C84();
        }
        int v37 = *((unsigned __int8 *)v34 - 4);
        if ((v37 & 4) != 0)
        {
          if (!*(_DWORD *)(a1 + 12 * (v33 + 12) + 12)) {
            sub_E5C84();
          }
          unsigned int v38 = *(_DWORD *)(a1 + 12 * (v33 + 12) + 8);
        }
        else
        {
          unsigned int v38 = 0;
        }
        if ((~v37 & 3) != 0)
        {
          if (!*(_DWORD *)(a1 + 12 * (v33 + 4) + 12)) {
            sub_E5C84();
          }
          unsigned int v40 = v32[v33];
          if (v40 == 32) {
            char v41 = 2;
          }
          else {
            char v41 = 1;
          }
          unsigned int v42 = v38 >> (v28 << v41);
          if (v40 == 32) {
            int v43 = 15;
          }
          else {
            int v43 = 3;
          }
          unsigned int v39 = *(_DWORD *)(a1 + 12 * (v33 + 4) + 8) - (v42 & v43) + 1;
          if (v39 > v40) {
            return 0;
          }
        }
        else
        {
          unsigned int v39 = 0;
        }
        v29 += dword_156320[v28] * v39;
        ++v33;
        int v34 = v35;
      }
      while (v31 != v33);
    }
    ++v28;
  }
  while (v28 != 4);
  if (v25 == 26) {
    int v44 = 15;
  }
  else {
    int v44 = 7;
  }
  if (((*(_DWORD *)(a4 + 540) + v29 + v44) & ~v44) != v16) {
    return 0;
  }
  return sub_E2BF4((unsigned int *)a1) == 0;
}

_DWORD *sub_E22C4(_DWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v6 = result;
  unint64_t v7 = 0;
  uint64_t v8 = 0;
  unsigned int v75 = result + 3;
  uint64_t v85 = a5;
  do
  {
    unsigned int v9 = 0;
    unint64_t v74 = v7;
    unint64_t v10 = v7 >> 2;
    uint64_t v89 = v10 << 6;
    uint64_t v77 = a5 + ((unint64_t)(v8 & 1) << 8) + (v10 << 6);
    int v84 = 4 * v10;
    if (dword_156320[v8] <= 1u) {
      int v11 = 1;
    }
    else {
      int v11 = dword_156320[v8];
    }
    uint64_t v12 = v6[85];
    uint64_t v13 = v12;
    int v87 = v11;
    do
    {
      if (v13 == 27)
      {
        unsigned int v14 = v9 + 1;
      }
      else
      {
        uint64_t v15 = 0;
        unsigned int v14 = v9 + 1;
        int v16 = v75;
        int v17 = v75;
        do
        {
          int v18 = *v17;
          v17 += 3;
          if (!v18) {
            sub_E5C84();
          }
          char v19 = *((unsigned char *)v16 - 4);
          if ((v19 & 4) != 0)
          {
            if (!v6[3 * (v15 + 12) + 3]) {
              sub_E5C84();
            }
            unsigned int v20 = v6[3 * (v15 + 12) + 2];
          }
          else
          {
            unsigned int v20 = 0;
          }
          int v21 = v19 & 3;
          if (v21 == 3)
          {
            unsigned int v22 = 0;
          }
          else
          {
            if (!v6[3 * (v15 + 4) + 3]) {
              sub_E5C84();
            }
            BOOL v23 = dword_155C70[13 * v13 + 3 + v15] == 32;
            if (dword_155C70[13 * v13 + 3 + v15] == 32) {
              char v24 = 2;
            }
            else {
              char v24 = 1;
            }
            unsigned int v25 = v20 >> (v8 << v24);
            if (v23) {
              int v26 = 15;
            }
            else {
              int v26 = 3;
            }
            unsigned int v22 = v6[3 * (v15 + 4) + 2] - (v25 & v26) + 1;
          }
          uint64_t result = (_DWORD *)sub_E1DBC(a4, v22);
          if (v22 >= 0x21) {
            sub_E5CDC();
          }
          if (v21 == 1) {
            unsigned int v27 = 0;
          }
          else {
            unsigned int v27 = 7;
          }
          if (v9 != 6) {
            unsigned int v27 = v9 + 1;
          }
          if (v8) {
            unsigned int v27 = v9;
          }
          uint32x4_t v28 = (uint32x4_t)vdupq_n_s32(v27);
          v29.i64[0] = 0x100000001;
          v29.i64[1] = 0x100000001;
          int8x16_t v30 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v28, (uint32x4_t)xmmword_1544C0), v29), (uint32x4_t)xmmword_1544B0);
          int8x16_t v31 = (int8x16_t)vshlq_u32((uint32x4_t)vandq_s8((int8x16_t)vshlq_u32(v28, (uint32x4_t)xmmword_1544A0), v29), (uint32x4_t)xmmword_1544B0);
          *(_DWORD *)&v90[64
                        * (unint64_t)(vorr_s8(*(int8x8_t *)v31.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v31, v31, 8uLL)).u32[0] | v31.i32[1])+ 16* (vorr_s8(*(int8x8_t *)v30.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v30, v30, 8uLL)).u32[0] | v30.i32[1])+ 4 * v15] = (int)(result << -(char)v22) >> -(char)v22;
          uint64_t v13 = v6[85];
          ++v15;
          int v16 = v17;
        }
        while (v15 < dword_155C70[13 * v13 + 2]);
        uint64_t v12 = v6[85];
        a5 = v85;
        int v11 = v87;
      }
      unsigned int v9 = v14;
    }
    while (v14 != v11);
    if (v12 != 27)
    {
      unsigned int v32 = 0;
      uint64_t v33 = (2 * v8) & 2;
      uint64_t v76 = v90;
      do
      {
        if (!v6[3 * v32 + 3]) {
          sub_E5C84();
        }
        uint64_t v34 = v32;
        int v35 = v6[3 * v32 + 2];
        if ((v35 & 4) != 0)
        {
          if (!v6[3 * v32 + 39]) {
            sub_E5C84();
          }
          unsigned int v36 = v6[3 * v32 + 38];
        }
        else
        {
          unsigned int v36 = 0;
        }
        unsigned int v37 = v6[3 * v32 + 2];
        BOOL v38 = dword_155C70[13 * v12 + 3 + v34] == 32;
        if (dword_155C70[13 * v12 + 3 + v34] == 32) {
          char v39 = 2;
        }
        else {
          char v39 = 1;
        }
        unsigned int v40 = v36 >> (v8 << v39);
        if (v38) {
          int v41 = 15;
        }
        else {
          int v41 = 3;
        }
        int v42 = v40 & v41;
        int v43 = v35 & 3;
        if (v43 == 3)
        {
          unsigned int v44 = 0;
          uint64_t v45 = 0;
          uint64_t v46 = 0;
        }
        else
        {
          if (!v6[3 * (v34 + 4) + 3]) {
            sub_E5C84();
          }
          unsigned int v44 = v6[3 * (v34 + 4) + 2] - v42 + 1;
          BOOL v23 = (v35 & 1 | 2) == 2;
          uint64_t v45 = 3;
          if (v23)
          {
            uint64_t v45 = 0;
            uint64_t v46 = 0;
          }
          else
          {
            uint64_t v46 = 1;
          }
        }
        uint64_t v47 = &v6[3 * (v34 + 8)];
        int v49 = v47[3];
        int64x2_t v48 = v47 + 3;
        if (!v49) {
          sub_E5C84();
        }
        uint64_t v50 = 0;
        uint64_t v51 = (uint64_t)&v6[3 * (v34 + 8) + 1];
        int v53 = *(_DWORD *)(v51 + 4);
        int v52 = (_DWORD *)(v51 + 4);
        *(_DWORD *)(a5 + (v46 << 7) + 16 * v45 + 4 * v34) = v53;
        int v54 = (v42 == 0) & (v37 >> 3);
        uint64_t v55 = (uint64_t)&v6[3 * (v34 + 16) + 1];
        uint64_t result = (_DWORD *)(v55 + 8);
        int v56 = (int *)(v55 + 4);
        uint64_t v57 = (uint64_t)&v6[3 * (v34 + 20) + 1];
        unsigned int v83 = (_DWORD *)(v57 + 8);
        uint64_t v58 = (uint64_t)&v6[3 * (v34 + 24) + 1];
        uint64_t v81 = (_DWORD *)(v58 + 4);
        unsigned int v82 = (_DWORD *)(v58 + 8);
        int v80 = (_DWORD *)(v57 + 4);
        char v59 = 1;
        do
        {
          uint64_t v60 = 0;
          unsigned int v61 = 0;
          char v78 = v59;
          uint64_t v62 = -v50;
          uint64_t v88 = v8 & 1 ^ v50 ^ 1;
          int v86 = v50 | v33;
          uint64_t v64 = v77 + (v50 << 7);
          int v65 = 3;
          int v66 = &v76[64 * v50];
          do
          {
            if (v62 != v33 || v89 + v60)
            {
              if (v54)
              {
                if (!*result) {
                  sub_E5C84();
                }
                int v67 = *v56;
              }
              else
              {
                int v67 = 0;
              }
              if (v44 >= 0x21) {
                sub_E5CDC();
              }
              int v68 = v67 << (-(char)v44 & 0x1F) >> (-(char)v44 & 0x1F);
              if (v43 == 2)
              {
                if (!*v83) {
                  sub_E5C84();
                }
                unsigned int v72 = dword_155C70[13 * v6[85] + 3 + v34];
                if (v72 >= 0x42) {
                  sub_E5CDC();
                }
                if (!*v82) {
                  sub_E5C84();
                }
                if (!*v48) {
                  sub_E5C84();
                }
                if (v72 >= 0x21) {
                  sub_E5D08();
                }
                a5 = v85;
                int v73 = (int)(((*v52
                            - v68
                            + *(_DWORD *)&v66[v60]
                            + ((int)(*v81 << -(v72 >> 1)) >> -(v72 >> 1)) * v86
                            + ((int)(*v80 << -(v72 >> 1)) >> -(v72 >> 1)) * (v84 + v61)) & ~(-1 << v72)) << -(char)v72) >> -(char)v72;
                goto LABEL_84;
              }
              if (v43 == 1)
              {
                unsigned int v70 = dword_155C70[13 * v6[85] + 3 + v34];
                if (v70 >= 0x21) {
                  sub_E5D08();
                }
                if ((v8 & 2) != 0) {
                  unsigned int v71 = v61;
                }
                else {
                  unsigned int v71 = v65;
                }
                uint64_t v63 = v88 | v33;
                int v79 = (2 * v8) & 0x3FFFFFFC;
                *(_DWORD *)(a5 + (v63 << 7) + 16 * (v71 + v79) + 4 * v34) = (int)(((*(_DWORD *)(a5
                                                                                                + ((unint64_t)dword_156220[16 * v63 + 1 + 2 * v71 + 2 * v79] << 7)
                                                                                                + 16
                                                                                                * dword_156220[16 * v63 + 2 * v71 + 2 * v79]
                                                                                                + 4 * v34)
                                                                                    - v68
                                                                                    + *(_DWORD *)&v90[64 * v88 + 16 * v71 + 4 * v34]) & ~(-1 << v70)) << -(char)v70) >> -(char)v70;
              }
              else
              {
                if (v43)
                {
                  int v73 = *(_DWORD *)(a5 + 4 * v34);
LABEL_84:
                  *(_DWORD *)(v64 + v60) = v73;
                  goto LABEL_85;
                }
                if (!*v48) {
                  sub_E5C84();
                }
                unsigned int v69 = dword_155C70[13 * v6[85] + 3 + v34];
                if (v69 >= 0x21) {
                  sub_E5D08();
                }
                *(_DWORD *)(v64 + v60) = (int)(((*v52 - v68 + *(_DWORD *)&v66[v60]) & ~(-1 << v69)) << -(char)v69) >> -(char)v69;
              }
            }
LABEL_85:
            ++v61;
            --v65;
            v60 += 16;
          }
          while (v60 != 64);
          char v59 = 0;
          uint64_t v50 = 1;
        }
        while ((v78 & 1) != 0);
        unsigned int v32 = v34 + 1;
        uint64_t v12 = v6[85];
        v76 += 4;
        v77 += 4;
      }
      while ((int)v34 + 1 < dword_155C70[13 * v12 + 2]);
    }
    ++v8;
    unint64_t v7 = v74 + 2;
  }
  while (v8 != 4);
  return result;
}

_DWORD *sub_E29F8(_DWORD *result, uint64_t a2)
{
  uint64_t v2 = 0;
  uint64_t v3 = result[85];
  uint64_t v4 = a2;
  do
  {
    uint64_t v5 = 0;
    uint64_t v6 = v4;
    uint64_t v7 = v3;
    do
    {
      if (v7 != 27)
      {
        uint64_t v8 = 0;
        unsigned int v9 = result + 3;
        do
        {
          if (!*v9) {
            sub_E5C84();
          }
          if ((*(unsigned char *)(v9 - 1) & 0x10) != 0)
          {
            uint64_t v10 = result[86];
            if (v8 != v10)
            {
              unsigned int v11 = dword_155C70[13 * v7 + 3 + v8];
              if (v11 >= 0x21) {
                sub_E5D08();
              }
              *(_DWORD *)(v6 + 4 * v8) = (int)((((*(_DWORD *)(a2 + (v2 << 7) + 16 * v5 + 4 * v10) >> (dword_155C70[13 * v7 + 3 + v10] - v11))
                                               + *(_DWORD *)(v6 + 4 * v8)) & ~(-1 << v11)) << -(char)v11) >> -(char)v11;
              uint64_t v3 = result[85];
            }
          }
          *(_DWORD *)(v6 + 4 * v8) &= ~(-1 << dword_155C70[13 * v3 + 3 + v8]);
          uint64_t v3 = result[85];
          ++v8;
          v9 += 3;
          uint64_t v7 = v3;
        }
        while (v8 < dword_155C70[13 * v3 + 2]);
      }
      ++v5;
      v6 += 16;
    }
    while (v5 != 8);
    ++v2;
    v4 += 128;
  }
  while (v2 != 4);
  return result;
}

uint64_t sub_E2B20(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a3 >= 0x21) {
    sub_E5D34();
  }
  char v3 = a2;
  unsigned int v4 = *(_DWORD *)(a1 + 536);
  if (a3 + a2 > v4)
  {
    printf("read overflow:  read bit=%d size=%d, total=%d\n", a2, a3, v4);
    __assert_rtn("get", "interchange_bit_pack.h", 85, "0");
  }
  int v5 = *(_DWORD *)(a1 + 512);
  unint64_t __dst = 0;
  uint64_t v6 = 528;
  if (!*(unsigned char *)(a1 + 544)) {
    uint64_t v6 = 520;
  }
  uint64_t v7 = *(void *)(a1 + v6);
  LODWORD(v8) = v5 - (a2 >> 3);
  if (v8 >= 8) {
    size_t v8 = 8;
  }
  else {
    size_t v8 = v8;
  }
  uint64_t v9 = -1 << a3;
  memcpy(&__dst, (const void *)(v7 + (a2 >> 3)), v8);
  return (__dst >> (v3 & 7)) & ~v9;
}

uint64_t sub_E2BF4(unsigned int *a1)
{
  unsigned int v1 = *a1;
  if (!a1[3 * LOBYTE(dword_155C70[13 * *a1 + 12]) + 3]) {
    sub_E5C84();
  }
  LODWORD(v2) = (LOBYTE(a1[3 * LOBYTE(dword_155C70[13 * *a1 + 12]) + 2]) >> 4) & 1;
  if (v1 == 21) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = v2;
  }
  if (v1 != 27)
  {
    uint64_t v4 = 0;
    int v5 = &dword_155C70[13 * v1];
    LODWORD(v6) = v5[2];
    if (v6 <= 1) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v6;
    }
    uint64_t v7 = a1 + 3;
    size_t v8 = v5 + 3;
    uint64_t v9 = a1 + 3;
    do
    {
      unsigned int v10 = *v9;
      v9 += 3;
      if (!v10) {
        sub_E5C84();
      }
      char v11 = *((unsigned char *)v7 - 4);
      if ((v11 & 3u) - 1 >= 2) {
        int v12 = v2;
      }
      else {
        int v12 = v2 | 2;
      }
      if ((v11 & 0x10) != 0) {
        LODWORD(v2) = v12;
      }
      if ((v1 > 0x16 || ((1 << v1) & 0x4000C3) == 0) && (v11 & 3) == 2) {
        LODWORD(v2) = v2 | 4;
      }
      int v13 = v11 & 3;
      if (v13 == 3)
      {
        if (!a1[3 * (v4 + 4) + 3]) {
          sub_E5C84();
        }
        if (v11 & 4 | a1[3 * (v4 + 4) + 2]) {
          LODWORD(v2) = v2 | 0x10;
        }
      }
      else
      {
        int v14 = v2 | 8;
        if (v1 != 26) {
          int v14 = v2;
        }
        if (v13 == 1) {
          LODWORD(v2) = v14;
        }
      }
      if (!a1[3 * (v4 + 4) + 3]) {
        sub_E5C84();
      }
      if (a1[3 * (v4 + 4) + 2] + 1 <= v8[v4]) {
        uint64_t v2 = v2;
      }
      else {
        uint64_t v2 = v2 | 0x20;
      }
      ++v4;
      uint64_t v7 = v9;
    }
    while (v6 != v4);
  }
  return v2;
}

uint64_t sub_E2D70(const void *a1, unint64_t a2, const void *a3)
{
  if (!a1)
  {
    if (sub_D1C38(0x14u, 4))
    {
      int v12 = sub_D1C7C(0x14u);
      __uint64_t v13 = sub_DDEFC();
      int v14 = (const char *)sub_D1CB0(4);
      if (v12)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: processor is NULL\n", v13, 20, v14, "AVE_VT_OF_StartSession", 128, "processor");
        sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | OF: processor is NULL");
    }
    goto LABEL_28;
  }
  if (!a3)
  {
    if (sub_D1C38(0x14u, 4))
    {
      int v15 = sub_D1C7C(0x14u);
      __uint64_t v16 = sub_DDEFC();
      int v17 = (const char *)sub_D1CB0(4);
      if (v15)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: session is NULL\n", v16, 20, v17, "AVE_VT_OF_StartSession", 130, "session");
        sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | OF: session is NULL");
    }
LABEL_28:
    uint64_t v7 = 0;
    uint64_t v23 = 4294954394;
    goto LABEL_29;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (DerivedStorage)
  {
    uint64_t v7 = DerivedStorage;
    pthread_mutex_lock((pthread_mutex_t *)(DerivedStorage + 165872));
    if (sub_D1C38(0x14u, 7))
    {
      int v8 = sub_D1C7C(0x14u);
      __uint64_t v9 = sub_DDEFC();
      unsigned int v10 = (const char *)sub_D1CB0(7);
      if (v8)
      {
        printf("%lld %d AVE %s: OF: ENTER %s, processor = %p, session = %p\n", v9, 20, v10, "AVE_VT_OF_StartSession", a1, a3);
        __uint64_t v11 = sub_DDEFC();
        uint64_t v64 = (const char *)sub_D1CB0(7);
        syslog(3, "%lld %d AVE %s: OF: ENTER %s, processor = %p, session = %p", v11, 20, v64, "AVE_VT_OF_StartSession", a1, a3);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: OF: ENTER %s, processor = %p, session = %p", v9, 20, v10, "AVE_VT_OF_StartSession", a1, a3);
      }
    }
    *(void *)uint64_t v7 = a3;
    *(void *)(v7 + 24) = v7;
    *(void *)(v7 + 32) = sub_E49A4;
    *(void *)(v7 + 48) = a3;
    uint64_t v22 = sub_B8E1C((_DWORD *)v7, a2, 0);
    if (v22)
    {
      uint64_t v23 = v22;
      if (!sub_D1C38(0x14u, 4)) {
        goto LABEL_29;
      }
      int v24 = sub_D1C7C(0x14u);
      __uint64_t v25 = sub_DDEFC();
      int v26 = (const char *)sub_D1CB0(4);
      if (v24)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: VE_OF_StartSession_Common failed, err = %d\n", v25, 20, v26, "AVE_VT_OF_StartSession", 147, "err == noErr", v23);
        __uint64_t v27 = sub_DDEFC();
        sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: VE_OF_StartSession_Common failed, err = %d", v27);
        goto LABEL_29;
      }
      uint64_t v72 = v23;
      uint64_t v71 = 147;
      int v66 = (void *)v26;
      int8x16_t v31 = "%lld %d AVE %s: %s:%d %s | OF: VE_OF_StartSession_Common failed, err = %d";
LABEL_44:
      syslog(3, v31, v25, 20, v66, "AVE_VT_OF_StartSession", v71, "err == noErr", v72);
      goto LABEL_29;
    }
    uint64_t v28 = sub_BFB8();
    if (v28)
    {
      uint64_t v23 = v28;
      if (!sub_D1C38(0x14u, 4)) {
        goto LABEL_29;
      }
      int v29 = sub_D1C7C(0x14u);
      __uint64_t v25 = sub_DDEFC();
      int8x16_t v30 = (const char *)sub_D1CB0(4);
      if (v29)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: AVE_PixelBufAttr_CreateDict failed, err = %d\n", v25, 20, v30, "AVE_VT_OF_StartSession", 161, "err == noErr", v23);
        __uint64_t v25 = sub_DDEFC();
        uint64_t v72 = v23;
        uint64_t v71 = 161;
        int v66 = sub_D1CB0(4);
      }
      else
      {
        uint64_t v72 = v23;
        uint64_t v71 = 161;
        int v66 = (void *)v30;
      }
      int8x16_t v31 = "%lld %d AVE %s: %s:%d %s | OF: AVE_PixelBufAttr_CreateDict failed, err = %d";
      goto LABEL_44;
    }
    uint64_t v37 = VTMotionEstimationProcessorSessionSetSourcePixelBufferAttributes();
    if (v37)
    {
      uint64_t v23 = v37;
      if (!sub_D1C38(0x14u, 4)) {
        goto LABEL_29;
      }
      int v38 = sub_D1C7C(0x14u);
      __uint64_t v25 = sub_DDEFC();
      char v39 = (const char *)sub_D1CB0(4);
      if (v38)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: Failed to set source pixel buffer attributes, err = %d\n", v25, 20, v39, "AVE_VT_OF_StartSession", 166, "err == noErr", v23);
        __uint64_t v25 = sub_DDEFC();
        uint64_t v72 = v23;
        uint64_t v71 = 166;
        int v66 = sub_D1CB0(4);
      }
      else
      {
        uint64_t v72 = v23;
        uint64_t v71 = 166;
        int v66 = (void *)v39;
      }
      int8x16_t v31 = "%lld %d AVE %s: %s:%d %s | OF: Failed to set source pixel buffer attributes, err = %d";
      goto LABEL_44;
    }
    char v40 = *(unsigned char *)(v7 + 18346);
    int v41 = *(_DWORD *)(v7 + 1888);
    int v42 = *(_DWORD *)(v7 + 1892);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      CFMutableDictionaryRef v44 = Mutable;
      uint64_t v45 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v45)
      {
        uint64_t v46 = v45;
        sub_C347C(kCVPixelBufferWidthKey, ((v41 << (2 * v40)) + 15) >> 4, v45);
        sub_C347C(kCVPixelBufferHeightKey, ((v42 << (2 * v40)) + 15) >> 4, v46);
        sub_C347C(kCVPixelBufferPixelFormatTypeKey, 843264104, v46);
        CFDictionarySetValue(v46, kCVPixelBufferIOSurfacePropertiesKey, v44);
        uint64_t v47 = VTMotionEstimationProcessorSessionSetMotionVectorPixelBufferAttributes();
        if (v47)
        {
          uint64_t v23 = v47;
          if (sub_D1C38(0x14u, 4))
          {
            int v48 = sub_D1C7C(0x14u);
            __uint64_t v49 = sub_DDEFC();
            uint64_t v50 = (const char *)sub_D1CB0(4);
            if (v48)
            {
              printf("%lld %d AVE %s: %s:%d %s | OF: Failed to set MV pixel buffer attributes, err = %d\n", v49, 20, v50, "AVE_VT_OF_StartSession", 190, "err == noErr", v23);
              __uint64_t v49 = sub_DDEFC();
              sub_D1CB0(4);
            }
            syslog(3, "%lld %d AVE %s: %s:%d %s | OF: Failed to set MV pixel buffer attributes, err = %d", v49);
          }
        }
        else
        {
          CFMutableDictionaryRef v59 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
          *(void *)(v7 + 166040) = v59;
          if (v59)
          {
            uint64_t v23 = 0;
          }
          else
          {
            if (sub_D1C38(0x14u, 4))
            {
              int v60 = sub_D1C7C(0x14u);
              __uint64_t v61 = sub_DDEFC();
              uint64_t v62 = (const char *)sub_D1CB0(4);
              if (v60)
              {
                printf("%lld %d AVE %s: %s:%d %s | OF: CFDictionaryCreateMutable failed\n", v61, 20, v62, "AVE_VT_OF_StartSession", 194, "OFPrivateStorage->FrameNumbertoRequestIDDict");
                __uint64_t v63 = sub_DDEFC();
                unsigned int v70 = (const char *)sub_D1CB0(4);
                syslog(3, "%lld %d AVE %s: %s:%d %s | OF: CFDictionaryCreateMutable failed", v63, 20, v70, "AVE_VT_OF_StartSession", 194, "OFPrivateStorage->FrameNumbertoRequestIDDict");
              }
              else
              {
                syslog(3, "%lld %d AVE %s: %s:%d %s | OF: CFDictionaryCreateMutable failed", v61, 20, v62, "AVE_VT_OF_StartSession", 194, "OFPrivateStorage->FrameNumbertoRequestIDDict");
              }
            }
            uint64_t v23 = 4294954392;
          }
        }
        CFRelease(v46);
      }
      else
      {
        if (sub_D1C38(0x14u, 4))
        {
          int v55 = sub_D1C7C(0x14u);
          __uint64_t v56 = sub_DDEFC();
          uint64_t v57 = (const char *)sub_D1CB0(4);
          if (v55)
          {
            printf("%lld %d AVE %s: %s:%d %s | OF: CFDictionaryCreateMutable failed\n", v56, 20, v57, "AVE_VT_OF_StartSession", 181, "MVPixelBufferAttributes");
            __uint64_t v58 = sub_DDEFC();
            unsigned int v69 = (const char *)sub_D1CB0(4);
            syslog(3, "%lld %d AVE %s: %s:%d %s | OF: CFDictionaryCreateMutable failed", v58, 20, v69, "AVE_VT_OF_StartSession", 181, "MVPixelBufferAttributes");
          }
          else
          {
            syslog(3, "%lld %d AVE %s: %s:%d %s | OF: CFDictionaryCreateMutable failed", v56, 20, v57, "AVE_VT_OF_StartSession", 181, "MVPixelBufferAttributes");
          }
        }
        uint64_t v23 = 4294954392;
      }
      CFRelease(v44);
    }
    else
    {
      if (sub_D1C38(0x14u, 4))
      {
        int v51 = sub_D1C7C(0x14u);
        __uint64_t v52 = sub_DDEFC();
        int v53 = (const char *)sub_D1CB0(4);
        if (v51)
        {
          printf("%lld %d AVE %s: %s:%d %s | OF: CFDictionaryCreateMutable failed\n", v52, 20, v53, "AVE_VT_OF_StartSession", 177, "IOSurfaceProperties");
          __uint64_t v54 = sub_DDEFC();
          int v68 = (const char *)sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | OF: CFDictionaryCreateMutable failed", v54, 20, v68, "AVE_VT_OF_StartSession", 177, "IOSurfaceProperties");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | OF: CFDictionaryCreateMutable failed", v52, 20, v53, "AVE_VT_OF_StartSession", 177, "IOSurfaceProperties");
        }
      }
      uint64_t v23 = 4294954392;
    }
  }
  else
  {
    if (sub_D1C38(0x14u, 4))
    {
      int v18 = sub_D1C7C(0x14u);
      __uint64_t v19 = sub_DDEFC();
      unsigned int v20 = (const char *)sub_D1CB0(4);
      if (v18)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed\n", v19, 20, v20, "AVE_VT_OF_StartSession", 134, "OFPrivateStorage");
        __uint64_t v21 = sub_DDEFC();
        int v65 = (const char *)sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed", v21, 20, v65, "AVE_VT_OF_StartSession", 134, "OFPrivateStorage");
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed", v19, 20, v20, "AVE_VT_OF_StartSession", 134, "OFPrivateStorage");
      }
    }
    uint64_t v7 = 0;
    uint64_t v23 = 4294949605;
  }
LABEL_29:
  if (sub_D1C38(0x14u, 7))
  {
    int v32 = sub_D1C7C(0x14u);
    __uint64_t v33 = sub_DDEFC();
    uint64_t v34 = (const char *)sub_D1CB0(7);
    if (v32)
    {
      printf("%lld %d AVE %s: OF: EXIT %s, err = %d\n", v33, 20, v34, "AVE_VT_OF_StartSession", v23);
      __uint64_t v35 = sub_DDEFC();
      int v67 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: OF: EXIT %s, err = %d", v35, 20, v67, "AVE_VT_OF_StartSession", v23);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: OF: EXIT %s, err = %d", v33, 20, v34, "AVE_VT_OF_StartSession", v23);
    }
  }
  if (v7) {
    pthread_mutex_unlock((pthread_mutex_t *)(v7 + 165872));
  }
  return v23;
}

uint64_t sub_E38F0(const void *a1, const void *a2, const void *a3, __CVBuffer *a4, char a5)
{
  if (!a1)
  {
    if (sub_D1C38(0x14u, 4))
    {
      int v16 = sub_D1C7C(0x14u);
      __uint64_t v17 = sub_DDEFC();
      int v18 = (const char *)sub_D1CB0(4);
      if (v16)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: processor is NULL\n", v17, 20, v18, "AVE_VT_OF_ProcessFrame", 251, "processor");
        sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | OF: processor is NULL");
    }
    goto LABEL_38;
  }
  if (!a3)
  {
    if (sub_D1C38(0x14u, 4))
    {
      int v19 = sub_D1C7C(0x14u);
      __uint64_t v20 = sub_DDEFC();
      __uint64_t v21 = (const char *)sub_D1CB0(4);
      if (v19)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: referenceFrame is NULL\n", v20, 20, v21, "AVE_VT_OF_ProcessFrame", 253, "referenceFrame");
        sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | OF: referenceFrame is NULL");
    }
    goto LABEL_38;
  }
  if (!a4)
  {
    if (sub_D1C38(0x14u, 4))
    {
      int v22 = sub_D1C7C(0x14u);
      __uint64_t v23 = sub_DDEFC();
      int v24 = (const char *)sub_D1CB0(4);
      if (v22)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: currentFrame is NULL\n", v23, 20, v24, "AVE_VT_OF_ProcessFrame", 255, "currentFrame");
        sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | OF: currentFrame is NULL");
    }
LABEL_38:
    uint64_t v11 = 0;
    CFMutableDictionaryRef Mutable = 0;
    uint64_t v31 = 4294954394;
    goto LABEL_39;
  }
  uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage)
  {
    if (sub_D1C38(0x14u, 4))
    {
      int v25 = sub_D1C7C(0x14u);
      __uint64_t v26 = sub_DDEFC();
      __uint64_t v27 = (const char *)sub_D1CB0(4);
      if (v25)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed\n", v26, 20, v27, "AVE_VT_OF_ProcessFrame", 259, "OFPrivateStorage");
        __uint64_t v28 = sub_DDEFC();
        uint64_t v47 = (const char *)sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed", v28, 20, v47, "AVE_VT_OF_ProcessFrame", 259, "OFPrivateStorage");
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed", v26, 20, v27, "AVE_VT_OF_ProcessFrame", 259, "OFPrivateStorage");
      }
    }
    uint64_t v11 = 0;
    CFMutableDictionaryRef Mutable = 0;
    uint64_t v31 = 4294949605;
    goto LABEL_39;
  }
  uint64_t v11 = DerivedStorage;
  int v12 = (unsigned int *)(DerivedStorage + 165868);
  pthread_mutex_lock((pthread_mutex_t *)(DerivedStorage + 165872));
  if (sub_D1C38(0x14u, 7))
  {
    int v13 = sub_D1C7C(0x14u);
    __uint64_t v14 = sub_DDEFC();
    int v15 = (const char *)sub_D1CB0(7);
    if (v13)
    {
      printf("%lld %d AVE %s: OF: ENTER %s, processor = %p, referenceFrame = %p, currentFrame = %p, requestID = %zu\n", v14, 20, v15, "AVE_VT_OF_ProcessFrame", a1, a3, a4, (size_t)a2);
      __uint64_t v14 = sub_DDEFC();
      sub_D1CB0(7);
    }
    syslog(3, "%lld %d AVE %s: OF: ENTER %s, processor = %p, referenceFrame = %p, currentFrame = %p, requestID = %zu", v14, 20);
  }
  if (*((unsigned char *)v12 + 156) && *(const void **)(v12 + 41) == a3)
  {
    CFMutableDictionaryRef Mutable = 0;
  }
  else
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionaryAddValue(Mutable, @"MakeKeyFrame", kCFBooleanTrue);
    if (Mutable) {
      CFRetain(Mutable);
    }
    uint64_t v30 = sub_B9B24();
    if (v30)
    {
      uint64_t v31 = v30;
      if (sub_D1C38(0x14u, 4))
      {
        int v32 = sub_D1C7C(0x14u);
        __uint64_t v33 = sub_DDEFC();
        uint64_t v34 = (const char *)sub_D1CB0(4);
        if (v32)
        {
          printf("%lld %d AVE %s: %s:%d %s | OF: AVE_OF_ProcessFrame_Common failed, err = %d\n", v33, 20, v34, "AVE_VT_OF_ProcessFrame", 274, "err == noErr", v31);
          __uint64_t v33 = sub_DDEFC();
          sub_D1CB0(4);
        }
LABEL_62:
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: AVE_OF_ProcessFrame_Common failed, err = %d", v33);
        goto LABEL_39;
      }
      goto LABEL_39;
    }
  }
  if (sub_D1C38(0x14u, 7))
  {
    int v35 = sub_D1C7C(0x14u);
    __uint64_t v36 = sub_DDEFC();
    uint64_t v37 = (const char *)sub_D1CB0(7);
    if (v35)
    {
      printf("%lld %d AVE %s: OF: %s: Map frame number (%u) to requestID (%zu)\n", v36, 20, v37, "AVE_VT_OF_ProcessFrame", *v12, (size_t)a2);
      __uint64_t v36 = sub_DDEFC();
      uint64_t v37 = (const char *)sub_D1CB0(7);
    }
    syslog(3, "%lld %d AVE %s: OF: %s: Map frame number (%u) to requestID (%zu)", v36, 20, v37, "AVE_VT_OF_ProcessFrame", *v12, (size_t)a2);
  }
  pthread_mutex_lock((pthread_mutex_t *)(v11 + 166048));
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(v12 + 43), (const void *)*v12, a2);
  pthread_mutex_unlock((pthread_mutex_t *)(v11 + 166048));
  uint64_t v43 = sub_B9B24();
  if (v43)
  {
    uint64_t v31 = v43;
    if (sub_D1C38(0x14u, 4))
    {
      int v44 = sub_D1C7C(0x14u);
      __uint64_t v33 = sub_DDEFC();
      uint64_t v45 = (const char *)sub_D1CB0(4);
      if (v44)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: AVE_OF_ProcessFrame_Common failed, err = %d\n", v33, 20, v45, "AVE_VT_OF_ProcessFrame", 286, "err == noErr", v31);
        __uint64_t v33 = sub_DDEFC();
        sub_D1CB0(4);
      }
      goto LABEL_62;
    }
LABEL_39:
    VTMotionEstimationProcessorSessionEmitMotionVectors();
    pthread_mutex_lock((pthread_mutex_t *)(v11 + 166048));
    if (CFDictionaryContainsValue(*(CFDictionaryRef *)(v11 + 166040), a2)) {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v11 + 166040), (const void *)(*(_DWORD *)(v11 + 165868) - 1));
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v11 + 166048));
    goto LABEL_42;
  }
  uint64_t v46 = *(__CVBuffer **)(v12 + 41);
  if (v46)
  {
    CVBufferRelease(v46);
    *(void *)(v12 + 41) = 0;
  }
  if (a5)
  {
    *((unsigned char *)v12 + 156) = 1;
    uint64_t v31 = 0;
    *(void *)(v12 + 41) = CVBufferRetain(a4);
  }
  else
  {
    uint64_t v31 = 0;
    *((unsigned char *)v12 + 156) = 0;
  }
LABEL_42:
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (sub_D1C38(0x14u, 7))
  {
    int v38 = sub_D1C7C(0x14u);
    __uint64_t v39 = sub_DDEFC();
    char v40 = (const char *)sub_D1CB0(7);
    if (v38)
    {
      printf("%lld %d AVE %s: OF: EXIT %s, err = %d\n", v39, 20, v40, "AVE_VT_OF_ProcessFrame", v31);
      __uint64_t v41 = sub_DDEFC();
      int v48 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: OF: EXIT %s, err = %d", v41, 20, v48, "AVE_VT_OF_ProcessFrame", v31);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: OF: EXIT %s, err = %d", v39, 20, v40, "AVE_VT_OF_ProcessFrame", v31);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v11 + 165872));
  return v31;
}

uint64_t sub_E4148(const void *a1)
{
  if (a1)
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (DerivedStorage)
    {
      uint64_t v3 = DerivedStorage;
      pthread_mutex_lock((pthread_mutex_t *)(DerivedStorage + 165872));
      if (sub_D1C38(0x14u, 7))
      {
        int v4 = sub_D1C7C(0x14u);
        __uint64_t v5 = sub_DDEFC();
        uint64_t v6 = (const char *)sub_D1CB0(7);
        if (v4)
        {
          printf("%lld %d AVE %s: OF: ENTER %s, processor = %p\n", v5, 20, v6, "AVE_VT_OF_CompleteFrames", a1);
          __uint64_t v7 = sub_DDEFC();
          __uint64_t v26 = (const char *)sub_D1CB0(7);
          syslog(3, "%lld %d AVE %s: OF: ENTER %s, processor = %p", v7, 20, v26, "AVE_VT_OF_CompleteFrames", a1);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: OF: ENTER %s, processor = %p", v5, 20, v6, "AVE_VT_OF_CompleteFrames", a1);
        }
      }
      uint64_t v16 = sub_BACDC(v3);
      if (v16 && sub_D1C38(0x14u, 4))
      {
        int v17 = sub_D1C7C(0x14u);
        __uint64_t v18 = sub_DDEFC();
        int v19 = (const char *)sub_D1CB0(4);
        if (v17)
        {
          printf("%lld %d AVE %s: %s:%d %s | OF: AVE_OF_Invalidate_Common failed, err = %d\n", v18, 20, v19, "AVE_VT_OF_CompleteFrames", 349, "err == noErr", v16);
          __uint64_t v18 = sub_DDEFC();
          sub_D1CB0(4);
        }
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: AVE_OF_Invalidate_Common failed, err = %d", v18);
      }
    }
    else
    {
      if (sub_D1C38(0x14u, 4))
      {
        int v12 = sub_D1C7C(0x14u);
        __uint64_t v13 = sub_DDEFC();
        __uint64_t v14 = (const char *)sub_D1CB0(4);
        if (v12)
        {
          printf("%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed\n", v13, 20, v14, "AVE_VT_OF_CompleteFrames", 343, "OFPrivateStorage");
          __uint64_t v15 = sub_DDEFC();
          __uint64_t v28 = (const char *)sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed", v15, 20, v28, "AVE_VT_OF_CompleteFrames", 343, "OFPrivateStorage");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed", v13, 20, v14, "AVE_VT_OF_CompleteFrames", 343, "OFPrivateStorage");
        }
      }
      uint64_t v3 = 0;
      uint64_t v16 = 4294949605;
    }
  }
  else
  {
    if (sub_D1C38(0x14u, 4))
    {
      int v8 = sub_D1C7C(0x14u);
      __uint64_t v9 = sub_DDEFC();
      unsigned int v10 = (const char *)sub_D1CB0(4);
      if (v8)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: processor is NULL\n", v9, 20, v10, "AVE_VT_OF_CompleteFrames", 339, "processor");
        __uint64_t v11 = sub_DDEFC();
        __uint64_t v27 = (const char *)sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: processor is NULL", v11, 20, v27, "AVE_VT_OF_CompleteFrames", 339, "processor");
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: processor is NULL", v9, 20, v10, "AVE_VT_OF_CompleteFrames", 339, "processor");
      }
    }
    uint64_t v3 = 0;
    uint64_t v16 = 4294954394;
  }
  __uint64_t v20 = *(__CVBuffer **)(v3 + 166032);
  if (v20)
  {
    CVBufferRelease(v20);
    *(void *)(v3 + 166032) = 0;
  }
  if (sub_D1C38(0x14u, 7))
  {
    int v21 = sub_D1C7C(0x14u);
    __uint64_t v22 = sub_DDEFC();
    __uint64_t v23 = (const char *)sub_D1CB0(7);
    if (v21)
    {
      printf("%lld %d AVE %s: OF: EXIT %s, err = %d\n", v22, 20, v23, "AVE_VT_OF_CompleteFrames", v16);
      __uint64_t v24 = sub_DDEFC();
      int v29 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: OF: EXIT %s, err = %d", v24, 20, v29, "AVE_VT_OF_CompleteFrames", v16);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: OF: EXIT %s, err = %d", v22, 20, v23, "AVE_VT_OF_CompleteFrames", v16);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v3 + 165872));
  return v16;
}

uint64_t AVE_VT_OF_CreateInstance(uint64_t a1, uint64_t a2, void *a3)
{
  v14.__sig = 0;
  *(void *)v14.__opaque = 0;
  sub_D1CE0();
  VTMotionEstimationProcessorGetClassID();
  uint64_t v4 = CMDerivedObjectCreate();
  if (v4)
  {
    uint64_t v5 = v4;
    if (sub_D1C38(0x14u, 4))
    {
      int v6 = sub_D1C7C(0x14u);
      __uint64_t v7 = sub_DDEFC();
      int v8 = (const char *)sub_D1CB0(4);
      if (v6)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: FigDerivedObjectCreate failed, err = %d\n", v7, 20, v8, "AVE_VT_OF_CreateInstance", 413, "err == noErr", v5);
        __uint64_t v9 = sub_DDEFC();
        sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigDerivedObjectCreate failed, err = %d", v9);
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigDerivedObjectCreate failed, err = %d", v7, 20, v8, "AVE_VT_OF_CreateInstance", 413, "err == noErr", v5);
      }
    }
  }
  else
  {
    if (sub_D1C38(0x14u, 4))
    {
      int v10 = sub_D1C7C(0x14u);
      __uint64_t v11 = sub_DDEFC();
      int v12 = (const char *)sub_D1CB0(4);
      if (v10)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: OFProcessor is NULL\n", v11, 20, v12, "AVE_VT_OF_CreateInstance", 415, "OFProcessor");
        sub_DDEFC();
        sub_D1CB0(4);
      }
      syslog(3, "%lld %d AVE %s: %s:%d %s | OF: OFProcessor is NULL");
    }
    uint64_t v5 = 4294954392;
  }
  sub_D1DA0();
  *a3 = 0;
  return v5;
}

void sub_E49A4(uint64_t a1, uint64_t a2, uint64_t a3, const void **a4)
{
  uint64_t v4 = *a4;
  value = 0;
  if (a1)
  {
    int v6 = (pthread_mutex_t *)(a1 + 166048);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 166048));
    if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 166040), v4, (const void **)&value))
    {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 166040), v4);
      pthread_mutex_unlock(v6);
      if (sub_D1C38(0x14u, 7))
      {
        int v7 = sub_D1C7C(0x14u);
        __uint64_t v8 = sub_DDEFC();
        __uint64_t v9 = (const char *)sub_D1CB0(7);
        if (v7)
        {
          printf("%lld %d AVE %s: OF: %s: Emit motion vectors for requestID (%zu) and processedFrameNumber (%zu)\n\n", v8, 20, v9, "AVE_VT_OF_EmitMotionVectors", (size_t)value, (size_t)v4);
          __uint64_t v8 = sub_DDEFC();
          __uint64_t v9 = (const char *)sub_D1CB0(7);
        }
        syslog(3, "%lld %d AVE %s: OF: %s: Emit motion vectors for requestID (%zu) and processedFrameNumber (%zu)\n", v8, 20, v9, "AVE_VT_OF_EmitMotionVectors", (size_t)value, (size_t)v4);
      }
      VTMotionEstimationProcessorSessionEmitMotionVectors();
    }
    else
    {
      pthread_mutex_unlock(v6);
      if (sub_D1C38(0x14u, 4))
      {
        int v13 = sub_D1C7C(0x14u);
        __uint64_t v14 = sub_DDEFC();
        __uint64_t v15 = (const char *)sub_D1CB0(4);
        if (v13)
        {
          printf("%lld %d AVE %s: OF: %s: Failed to find requestID from processedFrameNumber(%zu) to emit\n", v14, 20, v15, "AVE_VT_OF_EmitMotionVectors", (size_t)v4);
          sub_DDEFC();
          sub_D1CB0(4);
        }
        syslog(3, "%lld %d AVE %s: OF: %s: Failed to find requestID from processedFrameNumber(%zu) to emit");
      }
    }
  }
  else if (sub_D1C38(0x14u, 4))
  {
    int v10 = sub_D1C7C(0x14u);
    __uint64_t v11 = sub_DDEFC();
    int v12 = (const char *)sub_D1CB0(4);
    if (v10)
    {
      printf("%lld %d AVE %s: OF: %s: OFPrivateStorage is NULL\n", v11, 20, v12, "AVE_VT_OF_EmitMotionVectors");
      sub_DDEFC();
      sub_D1CB0(4);
    }
    syslog(3, "%lld %d AVE %s: OF: %s: OFPrivateStorage is NULL");
  }
}

uint64_t sub_E4C24(const void *a1)
{
  if (a1)
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (DerivedStorage)
    {
      uint64_t v3 = DerivedStorage;
      pthread_mutex_lock((pthread_mutex_t *)(DerivedStorage + 165872));
      if (sub_D1C38(0x14u, 7))
      {
        int v4 = sub_D1C7C(0x14u);
        __uint64_t v5 = sub_DDEFC();
        int v6 = (const char *)sub_D1CB0(7);
        if (v4)
        {
          printf("%lld %d AVE %s: OF: ENTER %s, processor = %p\n", v5, 20, v6, "AVE_VT_OF_Invalidate", a1);
          __uint64_t v7 = sub_DDEFC();
          __uint64_t v26 = (const char *)sub_D1CB0(7);
          syslog(3, "%lld %d AVE %s: OF: ENTER %s, processor = %p", v7, 20, v26, "AVE_VT_OF_Invalidate", a1);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: OF: ENTER %s, processor = %p", v5, 20, v6, "AVE_VT_OF_Invalidate", a1);
        }
      }
      uint64_t v16 = sub_BACDC(v3);
      if (v16 && sub_D1C38(0x14u, 4))
      {
        int v17 = sub_D1C7C(0x14u);
        __uint64_t v18 = sub_DDEFC();
        int v19 = (const char *)sub_D1CB0(4);
        if (v17)
        {
          printf("%lld %d AVE %s: %s:%d %s | OF: AVE_OF_Invalidate_Common failed, err = %d\n", v18, 20, v19, "AVE_VT_OF_Invalidate", 27, "err == noErr", v16);
          __uint64_t v18 = sub_DDEFC();
          sub_D1CB0(4);
        }
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: AVE_OF_Invalidate_Common failed, err = %d", v18);
      }
    }
    else
    {
      if (sub_D1C38(0x14u, 4))
      {
        int v12 = sub_D1C7C(0x14u);
        __uint64_t v13 = sub_DDEFC();
        __uint64_t v14 = (const char *)sub_D1CB0(4);
        if (v12)
        {
          printf("%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed\n", v13, 20, v14, "AVE_VT_OF_Invalidate", 21, "OFPrivateStorage");
          __uint64_t v15 = sub_DDEFC();
          __uint64_t v28 = (const char *)sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed", v15, 20, v28, "AVE_VT_OF_Invalidate", 21, "OFPrivateStorage");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed", v13, 20, v14, "AVE_VT_OF_Invalidate", 21, "OFPrivateStorage");
        }
      }
      uint64_t v3 = 0;
      uint64_t v16 = 4294949605;
    }
  }
  else
  {
    if (sub_D1C38(0x14u, 4))
    {
      int v8 = sub_D1C7C(0x14u);
      __uint64_t v9 = sub_DDEFC();
      int v10 = (const char *)sub_D1CB0(4);
      if (v8)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: processor is NULL\n", v9, 20, v10, "AVE_VT_OF_Invalidate", 17, "processor");
        __uint64_t v11 = sub_DDEFC();
        __uint64_t v27 = (const char *)sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: processor is NULL", v11, 20, v27, "AVE_VT_OF_Invalidate", 17, "processor");
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: processor is NULL", v9, 20, v10, "AVE_VT_OF_Invalidate", 17, "processor");
      }
    }
    uint64_t v3 = 0;
    uint64_t v16 = 4294954394;
  }
  __uint64_t v20 = *(__CVBuffer **)(v3 + 166032);
  if (v20)
  {
    CVBufferRelease(v20);
    *(void *)(v3 + 166032) = 0;
  }
  if (sub_D1C38(0x14u, 7))
  {
    int v21 = sub_D1C7C(0x14u);
    __uint64_t v22 = sub_DDEFC();
    __uint64_t v23 = (const char *)sub_D1CB0(7);
    if (v21)
    {
      printf("%lld %d AVE %s: OF: EXIT %s, err = %d\n", v22, 20, v23, "AVE_VT_OF_Invalidate", v16);
      __uint64_t v24 = sub_DDEFC();
      int v29 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: OF: EXIT %s, err = %d", v24, 20, v29, "AVE_VT_OF_Invalidate", v16);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: OF: EXIT %s, err = %d", v22, 20, v23, "AVE_VT_OF_Invalidate", v16);
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v3 + 165872));
  return v16;
}

uint64_t sub_E5048(const void *a1)
{
  if (a1)
  {
    uint64_t DerivedStorage = CMBaseObjectGetDerivedStorage();
    if (DerivedStorage)
    {
      uint64_t v3 = DerivedStorage;
      pthread_mutex_lock((pthread_mutex_t *)(DerivedStorage + 165872));
      if (sub_D1C38(0x14u, 7))
      {
        int v4 = sub_D1C7C(0x14u);
        __uint64_t v5 = sub_DDEFC();
        int v6 = (const char *)sub_D1CB0(7);
        if (v4)
        {
          printf("%lld %d AVE %s: OF: ENTER %s, processor = %p\n", v5, 20, v6, "AVE_VT_OF_Finalize", a1);
          __uint64_t v7 = sub_DDEFC();
          __uint64_t v24 = (const char *)sub_D1CB0(7);
          syslog(3, "%lld %d AVE %s: OF: ENTER %s, processor = %p", v7, 20, v24, "AVE_VT_OF_Finalize", a1);
        }
        else
        {
          syslog(3, "%lld %d AVE %s: OF: ENTER %s, processor = %p", v5, 20, v6, "AVE_VT_OF_Finalize", a1);
        }
      }
      sub_BB004(v3);
      int v16 = 0;
    }
    else
    {
      if (sub_D1C38(0x14u, 4))
      {
        int v12 = sub_D1C7C(0x14u);
        __uint64_t v13 = sub_DDEFC();
        __uint64_t v14 = (const char *)sub_D1CB0(4);
        if (v12)
        {
          printf("%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed\n", v13, 20, v14, "AVE_VT_OF_Finalize", 54, "OFPrivateStorage");
          __uint64_t v15 = sub_DDEFC();
          __uint64_t v26 = (const char *)sub_D1CB0(4);
          syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed", v15, 20, v26, "AVE_VT_OF_Finalize", 54, "OFPrivateStorage");
        }
        else
        {
          syslog(3, "%lld %d AVE %s: %s:%d %s | OF: FigBaseObjectGetDerivedStorage failed", v13, 20, v14, "AVE_VT_OF_Finalize", 54, "OFPrivateStorage");
        }
      }
      uint64_t v3 = 0;
      int v16 = -17691;
    }
  }
  else
  {
    if (sub_D1C38(0x14u, 4))
    {
      int v8 = sub_D1C7C(0x14u);
      __uint64_t v9 = sub_DDEFC();
      int v10 = (const char *)sub_D1CB0(4);
      if (v8)
      {
        printf("%lld %d AVE %s: %s:%d %s | OF: processor is NULL\n", v9, 20, v10, "AVE_VT_OF_Finalize", 50, "processor");
        __uint64_t v11 = sub_DDEFC();
        int v25 = (const char *)sub_D1CB0(4);
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: processor is NULL", v11, 20, v25, "AVE_VT_OF_Finalize", 50, "processor");
      }
      else
      {
        syslog(3, "%lld %d AVE %s: %s:%d %s | OF: processor is NULL", v9, 20, v10, "AVE_VT_OF_Finalize", 50, "processor");
      }
    }
    uint64_t v3 = 0;
    int v16 = -12902;
  }
  int v17 = *(__CVBuffer **)(v3 + 166032);
  if (v17)
  {
    CVBufferRelease(v17);
    *(void *)(v3 + 166032) = 0;
  }
  if (sub_D1C38(0x14u, 7))
  {
    int v18 = sub_D1C7C(0x14u);
    __uint64_t v19 = sub_DDEFC();
    __uint64_t v20 = (const char *)sub_D1CB0(7);
    if (v18)
    {
      printf("%lld %d AVE %s: OF: EXIT %s, err = %d\n", v19, 20, v20, "AVE_VT_OF_Finalize", v16);
      __uint64_t v21 = sub_DDEFC();
      __uint64_t v27 = (const char *)sub_D1CB0(7);
      syslog(3, "%lld %d AVE %s: OF: EXIT %s, err = %d", v21, 20, v27, "AVE_VT_OF_Finalize", v16);
    }
    else
    {
      syslog(3, "%lld %d AVE %s: OF: EXIT %s, err = %d", v19, 20, v20, "AVE_VT_OF_Finalize", v16);
    }
  }
  pthread_mutex_destroy((pthread_mutex_t *)(v3 + 166048));
  __uint64_t v22 = (pthread_mutex_t *)(v3 + 165872);
  pthread_mutex_unlock(v22);
  pthread_mutex_destroy(v22);

  return sub_D1DA0();
}

void sub_E53AC()
{
  __assert_rtn("AVE_DLList_Init", "AVE_DLList.c", 70, "psNode != ((void *)0)");
}

void sub_E53D8()
{
  __assert_rtn("AVE_DLList_Empty", "AVE_DLList.c", 85, "psNode != ((void *)0)");
}

void sub_E5404()
{
  __assert_rtn("AVE_DLList_Empty", "AVE_DLList.c", 86, "psNode->psPrev != ((void *)0)");
}

void sub_E5430()
{
  __assert_rtn("AVE_DLList_Empty", "AVE_DLList.c", 87, "psNode->psNext != ((void *)0)");
}

void sub_E545C()
{
  __assert_rtn("AVE_DLList_PopFront", "AVE_DLList.c", 344, "psList != ((void *)0)");
}

void sub_E5488()
{
  __assert_rtn("AVE_DLList_PopFront", "AVE_DLList.c", 346, "psList->psPrev != ((void *)0)");
}

void sub_E54B4()
{
  __assert_rtn("AVE_DLList_PopFront", "AVE_DLList.c", 347, "psList->psNext != ((void *)0)");
}

void sub_E54E0()
{
  __assert_rtn("AVE_DLList_Prev", "AVE_DLList.c", 159, "psNode != ((void *)0)");
}

void sub_E550C()
{
  __assert_rtn("AVE_DLList_Next", "AVE_DLList.c", 171, "psNode != ((void *)0)");
}

void sub_E5538()
{
  __assert_rtn("AVE_DLList_Erase", "AVE_DLList.c", 222, "psNode != ((void *)0)");
}

void sub_E5564()
{
  __assert_rtn("AVE_DLList_Erase", "AVE_DLList.c", 224, "psNode->psPrev != ((void *)0)");
}

void sub_E5590()
{
  __assert_rtn("AVE_DLList_Erase", "AVE_DLList.c", 225, "psNode->psNext != ((void *)0)");
}

void sub_E55BC()
{
  __assert_rtn("AVE_DLList_Front", "AVE_DLList.c", 271, "psList != ((void *)0)");
}

void sub_E55E8()
{
  __assert_rtn("AVE_DLList_Back", "AVE_DLList.c", 287, "psList != ((void *)0)");
}

void sub_E5614()
{
  __assert_rtn("AVE_DLList_PushBack", "AVE_DLList.c", 323, "psList != ((void *)0)");
}

void sub_E5640()
{
  __assert_rtn("AVE_DLList_PushBack", "AVE_DLList.c", 324, "psNewNode != ((void *)0)");
}

void sub_E566C()
{
  __assert_rtn("AVE_DLList_PushBack", "AVE_DLList.c", 326, "psList->psPrev != ((void *)0)");
}

void sub_E5698()
{
  __assert_rtn("AVE_DLList_PushBack", "AVE_DLList.c", 327, "psList->psNext != ((void *)0)");
}

void sub_E56C4()
{
  __assert_rtn("AVE_DLList_PopBack", "AVE_DLList.c", 365, "psList != ((void *)0)");
}

void sub_E56F0()
{
  __assert_rtn("AVE_DLList_PopBack", "AVE_DLList.c", 367, "psList->psPrev != ((void *)0)");
}

void sub_E571C()
{
  __assert_rtn("AVE_DLList_PopBack", "AVE_DLList.c", 368, "psList->psNext != ((void *)0)");
}

void sub_E5748()
{
  __assert_rtn("AVE_DLList_Begin", "AVE_DLList.c", 449, "psList != ((void *)0)");
}

void sub_E5774()
{
  __assert_rtn("AVE_DLList_End", "AVE_DLList.c", 461, "psList != ((void *)0)");
}

void sub_E57A0()
{
  __assert_rtn("AVE_DLList_RBegin", "AVE_DLList.c", 473, "psList != ((void *)0)");
}

void sub_E57CC()
{
  __assert_rtn("AVE_DLList_REnd", "AVE_DLList.c", 485, "psList != ((void *)0)");
}

void sub_E57F8()
{
  __assert_rtn("AVE_DevCap_Find", "AVE_DevCap.cpp", 1758, "pDevCap->psCEntry != __null");
}

void sub_E5824()
{
  __assert_rtn("AVE_DevCap_FindByType", "AVE_DevCap.cpp", 1788, "pDevCap->psCEntry != __null");
}

void sub_E5850()
{
  __assert_rtn("AVE_DevCap_Type2Idx", "AVE_DevCap.cpp", 1853, "idx >= 0");
}

void sub_E587C()
{
}

void sub_E58A8()
{
  __assert_rtn("dec_symbols", "htpc_entropy.h", 155, "bb_avail == 0");
}

void sub_E58D4()
{
  __assert_rtn("interchange_decompress_plane", "interchange.cpp", 99, "depth == 8 || depth == 10");
}

void sub_E5900()
{
  __assert_rtn("skip", "interchange_bit_pack.h", 103, "read_ptr <= size_bits()");
}

void sub_E592C()
{
  __assert_rtn("lossy_decompress_dquad", "interchange_lossy.h", 1063, "delta_quant <= ((1ull << delta_bits[c]) - 1)");
}

void sub_E5958()
{
  __assert_rtn("lossy_decompress_dquad", "interchange_lossy.h", 1013, "pixel_unpacked <= legal_pixel_size");
}

void sub_E5984()
{
  __assert_rtn("lossy_decompress_dquad", "interchange_lossy.h", 911, "mode_sz != 0");
}

void sub_E59B0()
{
  __assert_rtn("lossy_decompress_dquad", "interchange_lossy.h", 901, "mode_sz != 0");
}

void sub_E59DC()
{
  __assert_rtn("decompress", "interchange_decompressor.h", 203, "lossy_level == 0");
}

void sub_E5A08()
{
  __assert_rtn("decompress", "interchange_decompressor.h", 212, "lossy_level == 0");
}

void sub_E5A34()
{
}

void sub_E5A60()
{
}

void sub_E5A8C()
{
}

void sub_E5AB8()
{
}

void sub_E5AE4()
{
}

void sub_E5B10()
{
}

void sub_E5B3C(int a1)
{
  printf("comp_width = %d\n", a1);
  __assert_rtn("get_id", "interchange_lossy.h", 195, "fmt_id != 6");
}

void sub_E5B7C()
{
  __assert_rtn("derive_sharing", "interchange_lossy.h", 357, "start_level[3] <= 0");
}

void sub_E5BA8()
{
  __assert_rtn("derive_sharing", "interchange_lossy.h", 270, "mode[3] == 0 || mode[3] == 1");
}

void sub_E5BD4()
{
  __assert_rtn("decompressor", "interchange_decompressor.h", 41, "lossy_level == 0 || comp_type < COMP_TYPE_INVALID");
}

void sub_E5C00()
{
}

void sub_E5C2C()
{
  __assert_rtn("set_format", "interchange_header.h", 205, "header_layout_table[id].format == id");
}

void sub_E5C58()
{
  __assert_rtn("unpack", "interchange_bit_pack.h", 96, "size <= 32");
}

void sub_E5C84()
{
}

void sub_E5CB0()
{
}

void sub_E5CDC()
{
  __assert_rtn("sign_extend", "interchange_constants.h", 90, "width <= 32");
}

void sub_E5D08()
{
  __assert_rtn("wrap_to_range", "interchange_constants.h", 85, "width <= 32");
}

void sub_E5D34()
{
  __assert_rtn("get", "interchange_bit_pack.h", 82, "size <= 32");
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return _CFDictionaryContainsValue(theDict, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return _CFGetRetainCount(cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return _CFMachPortCreateRunLoopSource(allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return _CFMachPortCreateWithPort(allocator, portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return _CFNumberIsFloatType(number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

void CFShow(CFTypeRef obj)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return _CFStringGetSystemEncoding();
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return _CMBaseObjectGetDerivedStorage();
}

OSStatus CMBlockBufferCreateWithMemoryBlock(CFAllocatorRef structureAllocator, void *memoryBlock, size_t blockLength, CFAllocatorRef blockAllocator, const CMBlockBufferCustomBlockSource *customBlockSource, size_t offsetToData, size_t dataLength, CMBlockBufferFlags flags, CMBlockBufferRef *blockBufferOut)
{
  return _CMBlockBufferCreateWithMemoryBlock(structureAllocator, memoryBlock, blockLength, blockAllocator, customBlockSource, offsetToData, dataLength, flags, blockBufferOut);
}

OSStatus CMBlockBufferGetDataPointer(CMBlockBufferRef theBuffer, size_t offset, size_t *lengthAtOffsetOut, size_t *totalLengthOut, char **dataPointerOut)
{
  return _CMBlockBufferGetDataPointer(theBuffer, offset, lengthAtOffsetOut, totalLengthOut, dataPointerOut);
}

uint64_t CMDerivedObjectCreate()
{
  return _CMDerivedObjectCreate();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return _CMGetAttachment(target, key, attachmentModeOut);
}

OSStatus CMSampleBufferCreate(CFAllocatorRef allocator, CMBlockBufferRef dataBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMFormatDescriptionRef formatDescription, CMItemCount numSamples, CMItemCount numSampleTimingEntries, const CMSampleTimingInfo *sampleTimingArray, CMItemCount numSampleSizeEntries, const size_t *sampleSizeArray, CMSampleBufferRef *sampleBufferOut)
{
  return _CMSampleBufferCreate(allocator, dataBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, numSamples, numSampleTimingEntries, sampleTimingArray, numSampleSizeEntries, sampleSizeArray, sampleBufferOut);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return _CMSampleBufferGetSampleAttachmentsArray(sbuf, createIfNecessary);
}

OSStatus CMTagCollectionGetTagsWithCategory(CMTagCollectionRef tagCollection, CMTagCategory category, CMTag *tagBuffer, CMItemCount tagBufferCount, CMItemCount *numberOfTagsCopied)
{
  return _CMTagCollectionGetTagsWithCategory(tagCollection, category, tagBuffer, tagBufferCount, numberOfTagsCopied);
}

uint64_t CMTagGetFlagsValue(CMTag tag)
{
  return _CMTagGetFlagsValue(tag);
}

int64_t CMTagGetSInt64Value(CMTag tag)
{
  return _CMTagGetSInt64Value(tag);
}

CVPixelBufferRef CMTaggedBufferGroupGetCVPixelBufferForTag(CMTaggedBufferGroupRef group, CMTag tag, CFIndex *indexOut)
{
  return _CMTaggedBufferGroupGetCVPixelBufferForTag(group, tag, indexOut);
}

CMItemCount CMTaggedBufferGroupGetCount(CMTaggedBufferGroupRef group)
{
  return _CMTaggedBufferGroupGetCount(group);
}

CMTagCollectionRef CMTaggedBufferGroupGetTagCollectionAtIndex(CMTaggedBufferGroupRef group, CFIndex index)
{
  return _CMTaggedBufferGroupGetTagCollectionAtIndex(group, index);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return _CMTimeAdd(retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return _CMTimeCompare(time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return _CMTimeCopyAsDictionary(time, allocator);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return _CMTimeRangeCopyAsDictionary(range, allocator);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return _CMTimeRangeFromTimeToTime(retstr, start, end);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return _CMTimeRangeMakeFromDictionary(retstr, dictionaryRepresentation);
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return _CVBufferCopyAttachment(buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferCopyAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return _CVBufferCopyAttachments(buffer, attachmentMode);
}

void CVBufferRelease(CVBufferRef buffer)
{
}

CVBufferRef CVBufferRetain(CVBufferRef buffer)
{
  return _CVBufferRetain(buffer);
}

int CVColorPrimariesGetIntegerCodePointForString(CFStringRef colorPrimariesString)
{
  return _CVColorPrimariesGetIntegerCodePointForString(colorPrimariesString);
}

CFStringRef CVColorPrimariesGetStringForIntegerCodePoint(int colorPrimariesCodePoint)
{
  return _CVColorPrimariesGetStringForIntegerCodePoint(colorPrimariesCodePoint);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, planeIndex);
}

void CVPixelBufferGetExtendedPixels(CVPixelBufferRef pixelBuffer, size_t *extraColumnsOnLeft, size_t *extraColumnsOnRight, size_t *extraRowsOnTop, size_t *extraRowsOnBottom)
{
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetHeightOfPlane(pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetIOSurface(pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPixelFormatType(pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetPlaneCount(pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return _CVPixelBufferGetWidthOfPlane(pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return _CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return _CVPixelBufferPoolCreate(allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferPoolCreatePixelBuffer(allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return _CVPixelBufferRetain(texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
}

int CVTransferFunctionGetIntegerCodePointForString(CFStringRef transferFunctionString)
{
  return _CVTransferFunctionGetIntegerCodePointForString(transferFunctionString);
}

CFStringRef CVTransferFunctionGetStringForIntegerCodePoint(int transferFunctionCodePoint)
{
  return _CVTransferFunctionGetStringForIntegerCodePoint(transferFunctionCodePoint);
}

int CVYCbCrMatrixGetIntegerCodePointForString(CFStringRef yCbCrMatrixString)
{
  return _CVYCbCrMatrixGetIntegerCodePointForString(yCbCrMatrixString);
}

CFStringRef CVYCbCrMatrixGetStringForIntegerCodePoint(int yCbCrMatrixCodePoint)
{
  return _CVYCbCrMatrixGetStringForIntegerCodePoint(yCbCrMatrixCodePoint);
}

uint64_t FigFormatDescriptionRelease()
{
  return _FigFormatDescriptionRelease();
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallAsyncMethod(connection, selector, wake_port, reference, referenceCnt, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOCreateReceivePort(uint32_t msgType, mach_port_t *recvPort)
{
  return _IOCreateReceivePort(msgType, recvPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return _IOSurfaceCreate(properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return _IOSurfaceGetAllocSize(buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return _IOSurfaceGetBaseAddress(buffer);
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane()
{
  return _IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane();
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane()
{
  return _IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane();
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return _IOSurfaceGetBaseAddressOfPlane(buffer, planeIndex);
}

uint64_t IOSurfaceGetBytesPerCompressedTileHeaderOfPlane()
{
  return _IOSurfaceGetBytesPerCompressedTileHeaderOfPlane();
}

uint64_t IOSurfaceGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane()
{
  return _IOSurfaceGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane();
}

uint64_t IOSurfaceGetHTPCVerticalHeaderGroupingModeOfPlane()
{
  return _IOSurfaceGetHTPCVerticalHeaderGroupingModeOfPlane();
}

uint64_t IOSurfaceGetHeightInCompressedTilesOfPlane()
{
  return _IOSurfaceGetHeightInCompressedTilesOfPlane();
}

uint64_t IOSurfaceGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane()
{
  return _IOSurfaceGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane();
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return _IOSurfaceGetID(buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return _IOSurfaceGetPixelFormat(buffer);
}

uint64_t IOSurfaceGetProtectionOptions()
{
  return _IOSurfaceGetProtectionOptions();
}

int32_t IOSurfaceGetUseCount(IOSurfaceRef buffer)
{
  return _IOSurfaceGetUseCount(buffer);
}

uint64_t IOSurfaceGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane()
{
  return _IOSurfaceGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane();
}

uint64_t IOSurfaceGetWidthInCompressedTilesOfPlane()
{
  return _IOSurfaceGetWidthInCompressedTilesOfPlane();
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceLock(buffer, options, seed);
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return _IOSurfaceLookup(csid);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return _IOSurfaceUnlock(buffer, options, seed);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t VTEncoderSessionCreateCMBlockBuffer()
{
  return _VTEncoderSessionCreateCMBlockBuffer();
}

uint64_t VTEncoderSessionCreateMVHEVCThreeDimensionalReferenceDisplaysInfoSEIWithDefaults()
{
  return _VTEncoderSessionCreateMVHEVCThreeDimensionalReferenceDisplaysInfoSEIWithDefaults();
}

uint64_t VTEncoderSessionCreateVideoFormatDescription()
{
  return _VTEncoderSessionCreateVideoFormatDescription();
}

uint64_t VTEncoderSessionEmitEncodedFrame()
{
  return _VTEncoderSessionEmitEncodedFrame();
}

uint64_t VTEncoderSessionEmitEncodedTile()
{
  return _VTEncoderSessionEmitEncodedTile();
}

uint64_t VTEncoderSessionSetPixelBufferAttributes()
{
  return _VTEncoderSessionSetPixelBufferAttributes();
}

uint64_t VTEncoderSessionSetTimeRangesForNextPass()
{
  return _VTEncoderSessionSetTimeRangesForNextPass();
}

uint64_t VTMotionEstimationProcessorGetClassID()
{
  return _VTMotionEstimationProcessorGetClassID();
}

uint64_t VTMotionEstimationProcessorSessionCreateMotionVectorPixelBuffer()
{
  return _VTMotionEstimationProcessorSessionCreateMotionVectorPixelBuffer();
}

uint64_t VTMotionEstimationProcessorSessionEmitMotionVectors()
{
  return _VTMotionEstimationProcessorSessionEmitMotionVectors();
}

uint64_t VTMotionEstimationProcessorSessionSetMotionVectorPixelBufferAttributes()
{
  return _VTMotionEstimationProcessorSessionSetMotionVectorPixelBufferAttributes();
}

uint64_t VTMotionEstimationProcessorSessionSetSourcePixelBufferAttributes()
{
  return _VTMotionEstimationProcessorSessionSetSourcePixelBufferAttributes();
}

uint64_t VTMultiPassStorageCopyDataAtTimeStamp()
{
  return _VTMultiPassStorageCopyDataAtTimeStamp();
}

uint64_t VTMultiPassStorageGetTimeStamp()
{
  return _VTMultiPassStorageGetTimeStamp();
}

uint64_t VTMultiPassStorageGetTimeStampAndDuration()
{
  return _VTMultiPassStorageGetTimeStampAndDuration();
}

CFTypeID VTMultiPassStorageGetTypeID(void)
{
  return _VTMultiPassStorageGetTypeID();
}

uint64_t VTMultiPassStorageSetDataAtTimeStamp()
{
  return _VTMultiPassStorageSetDataAtTimeStamp();
}

uint64_t VTMultiPassStorageSetIdentifier()
{
  return _VTMultiPassStorageSetIdentifier();
}

uint64_t VTRegisterVideoEncoderWithInfo()
{
  return _VTRegisterVideoEncoderWithInfo();
}

uint64_t VTTileEncoderSessionCreateVideoFormatDescription()
{
  return _VTTileEncoderSessionCreateVideoFormatDescription();
}

uint64_t VTTileEncoderSessionSetTileAttributes()
{
  return _VTTileEncoderSessionSetTileAttributes();
}

uint64_t VTTileEncoderSessionSetTileEncodeRequirements()
{
  return _VTTileEncoderSessionSetTileEncodeRequirements();
}

uint64_t VTVideoEncoderGetClassID()
{
  return _VTVideoEncoderGetClassID();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return _fgetln(a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return _fseeko(__stream, a2, __whence);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

tm *__cdecl localtime(const time_t *a1)
{
  return _localtime(a1);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return _os_retain(object);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return _pthread_attr_getschedparam(a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return _pthread_attr_setschedparam(a1, a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return _pthread_cond_timedwait(a1, a2, a3);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return _pthread_mach_thread_np(a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return _pthread_mutexattr_settype(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

int rand(void)
{
  return _rand();
}

char *__cdecl setlocale(int a1, const char *a2)
{
  return _setlocale(a1, a2);
}

int setpriority(int a1, id_t a2, int a3)
{
  return _setpriority(a1, a2, a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

double strtod(const char *a1, char **a2)
{
  return _strtod(a1, a2);
}

uintmax_t strtoumax(const char *__nptr, char **__endptr, int __base)
{
  return _strtoumax(__nptr, __endptr, __base);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return _thread_policy_set(thread, flavor, policy_info, policy_infoCnt);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

uint64_t voucher_adopt()
{
  return _voucher_adopt();
}

uint64_t voucher_copy()
{
  return _voucher_copy();
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}