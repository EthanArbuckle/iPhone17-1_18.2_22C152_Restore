unint64_t PXGSpriteIndexRangeIntersection(unint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  BOOL v11;

  v2 = 0;
  if (HIDWORD(a1))
  {
    v3 = 0;
    if (HIDWORD(a2))
    {
      v4 = HIDWORD(a1) + a1;
      v5 = HIDWORD(a2) + a2;
      if (a1 <= a2) {
        v6 = a2;
      }
      else {
        v6 = a1;
      }
      if (v4 >= v5) {
        v7 = HIDWORD(a2) + a2;
      }
      else {
        v7 = HIDWORD(a1) + a1;
      }
      v8 = (unint64_t)(v7 - v6) << 32;
      v9 = v5 > a1;
      if (v5 > a1) {
        v10 = v8;
      }
      else {
        v10 = 0;
      }
      if (!v9) {
        v6 = 0;
      }
      v11 = v4 > a2;
      if (v4 > a2) {
        v2 = v10;
      }
      else {
        v2 = 0;
      }
      if (v11) {
        v3 = v6;
      }
      else {
        v3 = 0;
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3 | v2;
}

uint64_t PXGMediaKindGetSupportedResize(unsigned int a1)
{
  if (a1 > 0xC) {
    return 3;
  }
  else {
    return qword_2603C3A08[a1];
  }
}

id PXGCreateMetalTextureFromBytesInCGImage(CGImage *a1, void *a2, int *a3)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a2;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__513;
  v53 = __Block_byref_object_dispose__514;
  id v54 = 0;
  v8 = [v7 device];
  uint64_t v9 = [v8 limits];
  LODWORD(v3) = *(_DWORD *)(v9 + 132);
  LODWORD(v4) = *(_DWORD *)(v9 + 136);

  double v10 = (double)v3;
  double v11 = (double)v4;
  if (CGImageGetImageProvider())
  {
    uint64_t v12 = CGImageProviderCopyImageTextureData();
    if (v12)
    {
      uint64_t PixelFormat = CGImageTextureDataGetPixelFormat();
      CGImageTextureDataGetSize();
      double v16 = v15;
      uint64_t v45 = 0;
      v46 = &v45;
      uint64_t v47 = 0x2020000000;
      char v48 = 1;
      if (PixelFormat)
      {
        double v17 = v14;
        v18 = [v7 device];
        uint64_t v57 = 0;
        long long v56 = 0u;
        memset(buf, 0, sizeof(buf));
        MTLPixelFormatGetInfoForDevice();
        BOOL v19 = (~*(_DWORD *)&buf[8] & 5) == 0;

        if (v19)
        {
          if (MEMORY[0x26120F520](v16, v17, v10, v11))
          {
            v20 = PXGTungstenGetLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              v60.width = v16;
              v60.height = v17;
              NSStringFromCGSize(v60);
              id v21 = (id)objc_claimAutoreleasedReturnValue();
              v61.width = v10;
              v61.height = v11;
              NSStringFromCGSize(v61);
              id v22 = (id)objc_claimAutoreleasedReturnValue();
              v23 = [v7 device];
              *(_DWORD *)buf = 138543874;
              *(void *)&buf[4] = v21;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v22;
              *(_WORD *)&buf[22] = 2114;
              *(void *)&buf[24] = v23;
              _os_log_impl(&dword_26039F000, v20, OS_LOG_TYPE_ERROR, "Texture Data is too large %{public}@ > %{public}@ for device:%{public}@", buf, 0x20u);
            }
          }
          else
          {
            if (CGImageTextureDataSupportsTiledLayout() && PXGDeviceIsVirtualMachine_onceToken != -1) {
              dispatch_once(&PXGDeviceIsVirtualMachine_onceToken, &__block_literal_global_716);
            }
            v44 = v7;
            CGImageTextureDataGetDataWithBlock();
            v20 = v44;
          }
        }
        else
        {
          v20 = PXGTungstenGetLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v24 = [v7 device];
            *(_DWORD *)buf = 134218242;
            *(void *)&buf[4] = PixelFormat;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v24;
            _os_log_impl(&dword_26039F000, v20, OS_LOG_TYPE_DEFAULT, "Texture Data pixelFormat:%lu not supported for device:%{public}@", buf, 0x16u);
          }
        }
      }
      else
      {
        v20 = PXGTungstenGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v12;
          _os_log_impl(&dword_26039F000, v20, OS_LOG_TYPE_ERROR, "Texture Data has no valid pixelFormat:%@", buf, 0xCu);
        }
      }

      if (*((unsigned char *)v46 + 24)) {
        CGImageTextureDataRelease();
      }
      _Block_object_dispose(&v45, 8);
    }
  }
  if (!v50[5])
  {
    uint64_t v25 = PXGMetalPixelFormatForCGImage(a1, a3);
    size_t Width = CGImageGetWidth(a1);
    size_t Height = CGImageGetHeight(a1);
    if (!v25)
    {
      v30 = PXGTungstenGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = a1;
        v33 = "Image has no valid metal pixel format:%@";
LABEL_29:
        _os_log_impl(&dword_26039F000, v30, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);
      }
LABEL_30:

      goto LABEL_31;
    }
    double v28 = (double)Width;
    double v29 = (double)Height;
    if (MEMORY[0x26120F520]((double)Width, (double)Height, v10, v11))
    {
      v30 = PXGTungstenGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v62.width = v10;
        v62.height = v11;
        NSStringFromCGSize(v62);
        id v31 = (id)objc_claimAutoreleasedReturnValue();
        v32 = [v7 device];
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        *(_WORD *)&buf[22] = 2114;
        *(void *)&buf[24] = v32;
        _os_log_impl(&dword_26039F000, v30, OS_LOG_TYPE_ERROR, "Too large image %{public}@ > %{public}@ for device:%{public}@", buf, 0x20u);
      }
      goto LABEL_30;
    }
    if (CGImageGetAlphaInfo(a1) - 3 <= 1)
    {
      v30 = PXGTungstenGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = a1;
        v33 = "Image has straight alpha %{public}@";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
    unsigned int BytesPerRow = CGImageGetBytesPerRow(a1);
    DataProvider = CGImageGetDataProvider(a1);
    uint64_t BytePtr = CGDataProviderRetainBytePtr();
    if (BytePtr)
    {
      CFDataRef v39 = 0;
    }
    else
    {
      CFDataRef v43 = CGDataProviderCopyData(DataProvider);
      CFDataRef v39 = v43;
      if (!v43) {
        goto LABEL_31;
      }
      if (CFDataGetLength(v43) < 1 || (uint64_t BytePtr = (uint64_t)CFDataGetBytePtr(v39)) == 0)
      {
LABEL_39:
        CFRelease(v39);
        goto LABEL_31;
      }
    }
    uint64_t v40 = _createMetal2DTextureWithPixelFormat(v25, v7, 0, v28, v29);
    v41 = (void *)v50[5];
    v50[5] = v40;

    uint64_t v42 = v50[5];
    if (v42)
    {
      memset(buf, 0, 24);
      *(void *)&buf[24] = (unint64_t)v28;
      *(void *)&long long v56 = (unint64_t)v29;
      *((void *)&v56 + 1) = 1;
      objc_msgSend(v7, "copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:", BytePtr, v42, buf, (unint64_t)(v29 * (double)BytesPerRow));
    }
    if (v39) {
      goto LABEL_39;
    }
    CGDataProviderReleaseBytePtr();
  }
LABEL_31:
  id v34 = (id)v50[5];
  _Block_object_dispose(&v49, 8);

  return v34;
}

void sub_2603A19B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _createMetalTextureFromIOSurface(__IOSurface *a1, size_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  size_t WidthOfPlane = IOSurfaceGetWidthOfPlane(a1, a2);
  uint64_t v9 = objc_msgSend(MEMORY[0x263F12A50], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", a3, WidthOfPlane, IOSurfaceGetHeightOfPlane(a1, a2), 0);
  [v9 setUsage:1];
  double v10 = [v7 device];

  double v11 = (void *)[v10 newTextureWithDescriptor:v9 iosurface:a1 plane:a2];

  return v11;
}

uint64_t PXGCreateMetalTexturesFromIOSurface(__IOSurface *a1, void *a2, NSObject **a3, void *a4, int *a5)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v9 = a2;
  int v45 = 0;
  double Width = (double)IOSurfaceGetWidth(a1);
  double Height = (double)IOSurfaceGetHeight(a1);
  uint64_t v12 = [v9 device];
  uint64_t v13 = [v12 limits];
  LODWORD(v14) = *(_DWORD *)(v13 + 132);
  LODWORD(v15) = *(_DWORD *)(v13 + 136);
  double v16 = (double)v14;
  double v17 = (double)v15;

  if (MEMORY[0x26120F520](Width, Height, v16, v17))
  {
    v18 = PXGTungstenGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v55.width = Width;
      v55.height = Height;
      BOOL v19 = NSStringFromCGSize(v55);
      v56.width = v16;
      v56.height = v17;
      v20 = NSStringFromCGSize(v56);
      id v21 = [v9 device];
      *(_DWORD *)buf = 138544130;
      *(void *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v19;
      *(_WORD *)&buf[22] = 2114;
      *(void *)&buf[24] = v20;
      LOWORD(v48) = 2114;
      *(void *)((char *)&v48 + 2) = v21;
      _os_log_impl(&dword_26039F000, v18, OS_LOG_TYPE_ERROR, "Surface %{public}@ is too large %{public}@ > %{public}@ for device:%{public}@", buf, 0x2Au);
    }
LABEL_29:
    uint64_t v25 = 0;
    goto LABEL_30;
  }
  uint64_t v22 = PXGCreateMetalTextureFromIOSurface(a1, v9, &v45);
  if (v22)
  {
    v18 = v22;
    v23 = 0;
LABEL_6:
    v18 = v18;
    *a3 = v18;
    id v24 = v23;
    *a4 = v24;
    *a5 = v45;

    uint64_t v25 = 1;
LABEL_30:

    goto LABEL_31;
  }
  signed int PixelFormat = IOSurfaceGetPixelFormat(a1);
  uint64_t v25 = 0;
  if (PixelFormat > 875704437)
  {
    if (PixelFormat > 2016686641)
    {
      if (PixelFormat == 2016686642 || PixelFormat == 2019963442) {
        goto LABEL_23;
      }
      int v27 = 2019963440;
    }
    else
    {
      if (PixelFormat == 875704438 || PixelFormat == 875704934) {
        goto LABEL_23;
      }
      int v27 = 2016686640;
    }
  }
  else
  {
    if (PixelFormat <= 645424687)
    {
      if (PixelFormat != 32 && PixelFormat != 641230384)
      {
        int v27 = 641234480;
        goto LABEL_22;
      }
LABEL_23:
      if (IOSurfaceGetPlaneCount(a1) != 2)
      {
        uint64_t v25 = 0;
        goto LABEL_31;
      }
      uint64_t v28 = IOSurfaceGetPixelFormat(a1);
      int is_video_range = ycbcr_fourcc_is_video_range(v28);
      int v53 = 0;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v48 = 0u;
      memset(buf, 0, sizeof(buf));
      uint64_t v46 = 116;
      if (IOSurfaceGetBulkAttachments())
      {
        v18 = 0;
        v23 = 0;
        int v45 = 0;
        goto LABEL_26;
      }
      if (BYTE10(v49) == 9)
      {
        BOOL v32 = is_video_range == 0;
        int v33 = 1536;
        int v34 = 1280;
      }
      else if (BYTE10(v49) == 7)
      {
        BOOL v32 = is_video_range == 0;
        int v33 = 2048;
        int v34 = 1792;
      }
      else
      {
        BOOL v32 = is_video_range == 0;
        if (BYTE10(v49) == 1)
        {
          int v33 = 1024;
          int v34 = 768;
        }
        else
        {
          int v33 = 512;
          int v34 = 256;
        }
      }
      if (v32) {
        int v35 = v33;
      }
      else {
        int v35 = v34;
      }
      if (ycbcr_fourcc_bits_per_component(v28) == 10) {
        unsigned int v36 = 0x2000;
      }
      else {
        unsigned int v36 = 4096;
      }
      int v45 = v36 | v35;
      unsigned int v37 = v36 >> 12;
      if (v37 != 1)
      {
        if (v37 != 2)
        {
          v18 = 0;
          v23 = 0;
          goto LABEL_26;
        }
        v38 = [v9 device];
        *(void *)&long long v49 = 0;
        long long v48 = 0u;
        memset(buf, 0, sizeof(buf));
        MTLPixelFormatGetInfoForDevice();
        if ((~*(_DWORD *)&buf[8] & 5) != 0)
        {
        }
        else
        {
          CFDataRef v39 = [v9 device];
          *(void *)&long long v49 = 0;
          long long v48 = 0u;
          memset(buf, 0, sizeof(buf));
          uint64_t v40 = 578;
          MTLPixelFormatGetInfoForDevice();
          int v41 = ~*(_DWORD *)&buf[8] & 5;

          if (!v41)
          {
            uint64_t v42 = 576;
LABEL_55:
            v18 = _createMetalTextureFromIOSurface(a1, 0, v42, v9);
            uint64_t v43 = _createMetalTextureFromIOSurface(a1, 1uLL, v40, v9);
            v23 = (void *)v43;
            if (v18 && v43) {
              goto LABEL_6;
            }
LABEL_26:
            v30 = PXAssertGetLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              OSType v44 = IOSurfaceGetPixelFormat(a1);
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = a1;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v44;
              _os_log_error_impl(&dword_26039F000, v30, OS_LOG_TYPE_ERROR, "Unable to create texture for surface %@ with format:%u", buf, 0x12u);
            }

            goto LABEL_29;
          }
        }
        uint64_t v40 = 60;
        uint64_t v42 = 20;
        goto LABEL_55;
      }
      uint64_t v40 = 30;
      uint64_t v42 = 10;
      goto LABEL_55;
    }
    if (PixelFormat == 645424688 || PixelFormat == 645428784) {
      goto LABEL_23;
    }
    int v27 = 875704422;
  }
LABEL_22:
  if (PixelFormat == v27) {
    goto LABEL_23;
  }
LABEL_31:

  return v25;
}

double PXGMaxTextureSize(void *a1)
{
  LODWORD(v1) = *(_DWORD *)([a1 limits] + 132);
  return (double)v1;
}

id PXGCreateMetalTextureFromIOSurface(__IOSurface *a1, void *a2, _DWORD *a3)
{
  id v5 = a2;
  uint64_t PixelFormat = IOSurfaceGetPixelFormat(a1);
  uint64_t v7 = PXGMetalPixelFormatForOSType(PixelFormat);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = _createMetalTextureFromIOSurface(a1, 0, v7, v5);
    double v10 = (void *)v9;
    if (a3 && v9) {
      *a3 = 4 * (v8 == 10);
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

uint64_t PXGMetalPixelFormatForOSType(uint64_t a1)
{
  uint64_t v2 = 80;
  while (1)
  {
    if ((int)a1 <= 875836467)
    {
      if ((int)a1 <= 875704437)
      {
        if ((int)a1 <= 843264309)
        {
          if ((int)a1 <= 645424687)
          {
            if (a1 == 641230384 || a1 == 641234480) {
              return 500;
            }
          }
          else
          {
            if (a1 == 645424688 || a1 == 645428784) {
              return 508;
            }
            if (a1 == 843264104) {
              return 65;
            }
          }
          goto LABEL_20;
        }
        switch(a1)
        {
          case 0x34323066:
            goto LABEL_17;
          case 0x32433136:
            return 60;
          case 0x32767579:
            return 562;
        }
        goto LABEL_20;
      }
      if (a1 != 875704438 && a1 != 875704934 && a1 != 875704950) {
        goto LABEL_20;
      }
LABEL_17:
      int v3 = a1 & 0xFFFFFFEF;
      if ((a1 & 0xFFFFFFEF) == 0x34323066) {
        return 500;
      }
      if (v3 == 875704934) {
        return 502;
      }
      if (v3 == 875836518) {
        return 503;
      }
      goto LABEL_20;
    }
    if ((int)a1 <= 1093677111)
    {
      if (a1 != 875836518 && a1 != 875836534)
      {
        if (a1 == 875836468) {
          return 42;
        }
        goto LABEL_20;
      }
      goto LABEL_17;
    }
    if ((int)a1 > 1885745713)
    {
      if ((int)a1 <= 2019963439)
      {
        if ((int)a1 <= 1886860339)
        {
          if ((int)a1 > 1886859823)
          {
            if (a1 == 1886859824) {
              return 508;
            }
            if (a1 == 1886859826) {
              return 509;
            }
          }
          else
          {
            if (a1 == 1885745714) {
              return 509;
            }
            if (a1 == 1885746228) {
              return 510;
            }
          }
          goto LABEL_20;
        }
        if ((int)a1 > 2016686641)
        {
          switch(a1)
          {
            case 0x78343232:
              return 506;
            case 0x78343434:
              return 507;
            case 0x78343470:
              return 504;
          }
          goto LABEL_20;
        }
        if (a1 == 1886860340) {
          return 510;
        }
        int v7 = 2016686640;
      }
      else
      {
        if ((int)a1 > 2021077553)
        {
          if ((int)a1 <= 2021078127)
          {
            if (a1 == 2021077554) {
              return 506;
            }
            if (a1 == 2021078068) {
              return 507;
            }
          }
          else
          {
            if (a1 == 2021078128) {
              return 504;
            }
            if (a1 == 2037741158 || a1 == 2037741171) {
              return 501;
            }
          }
          goto LABEL_20;
        }
        if ((int)a1 <= 2019963955)
        {
          if (a1 == 2019963440) {
            return 505;
          }
          if (a1 == 2019963442) {
            return 506;
          }
          goto LABEL_20;
        }
        if (a1 == 2019963956) {
          return 507;
        }
        if (a1 == 2019964016) {
          return 504;
        }
        int v7 = 2021077552;
      }
      if (a1 == v7) {
        return 505;
      }
      goto LABEL_20;
    }
    if ((int)a1 > 1380401728) {
      break;
    }
    if ((int)a1 <= 1278555444)
    {
      if ((int)a1 <= 1278226487)
      {
        if (a1 == 1093677112) {
          return 1;
        }
        int v6 = 1111970369;
        goto LABEL_68;
      }
      if (a1 == 1278226488) {
        return 10;
      }
      if (a1 == 1278226742) {
        return 20;
      }
    }
    else if ((int)a1 <= 1279340599)
    {
      if (a1 == 1278555445) {
        return 43;
      }
      if (a1 == 1278555701) {
        return 40;
      }
    }
    else
    {
      if (a1 == 1279340600 || a1 == 1279342648) {
        return 30;
      }
      if (a1 == 1378955371) {
        return 90;
      }
    }
LABEL_20:
    uint64_t v4 = fourcc_compressed_of_type(a1);
    BOOL v5 = v4 == a1;
    a1 = v4;
    if (v5) {
      return 0;
    }
  }
  if ((int)a1 > 1815491697)
  {
    if ((int)a1 <= 1882468913)
    {
      if (a1 == 1815491698) {
        return 110;
      }
      int v8 = 1882468912;
    }
    else
    {
      if (a1 == 1882468914) {
        return 509;
      }
      if (a1 == 1882469428) {
        return 510;
      }
      int v8 = 1885745712;
    }
    if (a1 == v8) {
      return 508;
    }
    goto LABEL_20;
  }
  if ((int)a1 > 1380411456)
  {
    if (a1 == 1380411457) {
      return 115;
    }
    if (a1 == 1599554369) {
      return v2;
    }
    int v6 = 1599554371;
LABEL_68:
    if (a1 == v6) {
      return v2;
    }
    goto LABEL_20;
  }
  if (a1 == 1380401729) {
    return 70;
  }
  if (a1 != 1380410945) {
    goto LABEL_20;
  }
  return 125;
}

id _createMetal2DTextureWithPixelFormat(uint64_t a1, void *a2, int a3, double a4, double a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a2;
  double v10 = [v9 device];
  double v11 = _createMetal2DTextureDescriptorWithPixelFormat(a1, a3, a4, a5);

  uint64_t v12 = (void *)[v9 newTextureWithDescriptor:v11];
  if (!v12)
  {
    uint64_t v13 = PXAssertGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      unint64_t v15 = [v9 device];
      int v16 = 138412802;
      double v17 = v15;
      __int16 v18 = 2048;
      uint64_t v19 = a1;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_fault_impl(&dword_26039F000, v13, OS_LOG_TYPE_FAULT, "Device:%@ failed to create pixelFormat:%lu texture:%@", (uint8_t *)&v16, 0x20u);
    }
  }

  return v12;
}

id _createMetal2DTextureDescriptorWithPixelFormat(uint64_t a1, int a2, double a3, double a4)
{
  BOOL v5 = [MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:a1 width:(unint64_t)a3 height:(unint64_t)a4 mipmapped:0];
  [v5 setResourceOptions:0];
  if (a2) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 1;
  }
  [v5 setUsage:v6];

  return v5;
}

uint64_t PXGMetalPixelFormatForCGImage(CGImage *a1, int *a2)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  __int16 BitmapInfo = CGImageGetBitmapInfo(a1);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(a1);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(a1);
  int v7 = BitmapInfo & 0x1B;
  BOOL v8 = (BitmapInfo & 0x1F) == 7 && (BitmapInfo & 0x1B) != 1;
  BOOL v9 = v7 != 2 && (BitmapInfo & 0x1B) == 1;
  if (v7 == 2) {
    BOOL v8 = 0;
  }
  BOOL v10 = v7 == 2;
  BOOL v11 = (BitmapInfo & 0x3000) != 0 && v10;
  BOOL v12 = (BitmapInfo & 0x3000) == 0 && v10;
  BOOL v13 = (BitmapInfo & 0x3000) != 0 && v9;
  BOOL v14 = (BitmapInfo & 0x3000) == 0 && v9;
  unint64_t v15 = (BitsPerPixel + BitsPerComponent - 1) / BitsPerComponent;
  if ((BitmapInfo & 0x100) != 0)
  {
    if (v15 == 4)
    {
      int v19 = 0;
      if (BitsPerComponent == 16)
      {
        uint64_t v18 = 115;
        goto LABEL_70;
      }
      if (BitsPerComponent == 32)
      {
        int v19 = 0;
        uint64_t v18 = 125;
        goto LABEL_70;
      }
      goto LABEL_66;
    }
LABEL_46:
    uint64_t v18 = 0;
    int v19 = 0;
LABEL_67:
    v23 = PXGTungstenGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      int v25 = 138412290;
      v26 = a1;
      _os_log_impl(&dword_26039F000, v23, OS_LOG_TYPE_DEBUG, "No matching MTLPixelFormat for image:%@", (uint8_t *)&v25, 0xCu);
    }

    goto LABEL_70;
  }
  if (BitsPerComponent != 8)
  {
    if (BitsPerComponent == 5)
    {
      BOOL v16 = v15 != 4;
      char v17 = v15 != 4 || v11;
      if (v15 == 4) {
        uint64_t v18 = 43;
      }
      else {
        uint64_t v18 = 0;
      }
      int v19 = 0;
      if ((v17 & 1) == 0)
      {
        if (v13)
        {
          uint64_t v18 = 41;
          goto LABEL_70;
        }
LABEL_66:
        uint64_t v18 = 0;
        goto LABEL_67;
      }
    }
    else
    {
      BOOL v20 = BitsPerComponent == 16 && v15 == 4;
      BOOL v16 = !v20;
      int v21 = !v20 || v14;
      char v22 = v21 | v12;
      if (v20) {
        uint64_t v18 = 110;
      }
      else {
        uint64_t v18 = 0;
      }
      if ((v22 & 1) == 0)
      {
        int v19 = 0;
        if (v13)
        {
          uint64_t v18 = 110;
          goto LABEL_70;
        }
        goto LABEL_66;
      }
      int v19 = v21 ^ 1;
    }
    if (!v16) {
      goto LABEL_70;
    }
    goto LABEL_67;
  }
  if (v15 != 4)
  {
    if (v15 == 2)
    {
      int v19 = 8;
      uint64_t v18 = 30;
      goto LABEL_70;
    }
    if (v15 == 1)
    {
      if (v8) {
        int v19 = 0;
      }
      else {
        int v19 = 4;
      }
      if (v8) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = 10;
      }
      goto LABEL_70;
    }
    goto LABEL_46;
  }
  if (v11) {
    uint64_t v18 = 80;
  }
  else {
    uint64_t v18 = 70;
  }
  if (v11 || v14)
  {
    int v19 = 0;
    goto LABEL_70;
  }
  if (v13) {
    int v19 = 2;
  }
  else {
    int v19 = 0;
  }
  if (v13) {
    uint64_t v18 = 80;
  }
  else {
    uint64_t v18 = 0;
  }
  if (!v13 && v12)
  {
    int v19 = 1;
    uint64_t v18 = 70;
    goto LABEL_70;
  }
  if (!v13) {
    goto LABEL_67;
  }
LABEL_70:
  if (a2) {
    *a2 = v19;
  }
  return v18;
}

double PXGCreateTextureInfo@<D0>(int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>, double a8, double a9, double a10, double a11, float32x4_t a12, int a13)
{
  double v14 = a6;
  double v15 = a5;
  double v16 = a4;
  v17.f64[0] = a3;
  float64x2_t v19 = vcvt_hight_f64_f32(a12);
  float64x2_t v20 = vcvtq_f64_f32(*(float32x2_t *)a12.f32);
  double v21 = 0.0;
  double v22 = 0.0;
  switch(a1)
  {
    case 1:
      *(float64x2_t *)&v61.a = v20;
      *(float64x2_t *)&v61.c = v19;
      v61.tx = 0.0;
      v61.ty = 0.0;
      CGFloat v23 = 1.57079633;
      goto LABEL_4;
    case 2:
      *(float64x2_t *)&v61.a = v20;
      *(float64x2_t *)&v61.c = v19;
      v61.tx = 0.0;
      v61.ty = 0.0;
      CGFloat v23 = 3.14159265;
LABEL_4:
      float64_t v49 = v17.f64[0];
      CGAffineTransformRotate(&v62, &v61, v23);
      v17.f64[0] = v49;
      double v16 = a4;
      float64x2_t v20 = *(float64x2_t *)&v62.a;
      float64x2_t v19 = *(float64x2_t *)&v62.c;
      break;
    case 3:
      break;
    case 4:
      double v50 = a3;
      double v56 = a4;
      float64x2_t v39 = v20;
      float64x2_t v44 = v19;
      PXSizeGetAspectRatio();
      PXRectWithAspectRatioFillingRect();
      goto LABEL_7;
    case 5:
      double v50 = a3;
      double v56 = a4;
      float64x2_t v39 = v20;
      float64x2_t v44 = v19;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
LABEL_7:
      float64x2_t v20 = v39;
      float64x2_t v19 = v44;
      v17.f64[0] = v50;
      double v16 = v56;
      double v22 = v24;
      goto LABEL_12;
    case 6:
      float64x2_t v40 = v20;
      float64x2_t v45 = v19;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      float64x2_t v20 = v40;
      float64x2_t v19 = v45;
      v17.f64[0] = a3;
      double v16 = a4;
      double v22 = v28;
      goto LABEL_13;
    case 7:
      float64x2_t v41 = v20;
      float64x2_t v46 = v19;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      float64x2_t v20 = v41;
      float64x2_t v19 = v46;
      v17.f64[0] = a3;
      double v16 = a4;
      double v21 = v29;
      double v14 = v30;
      double v22 = v15 - a10;
      double v15 = v31;
      break;
    case 8:
      float64x2_t v42 = v20;
      float64x2_t v47 = v19;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      float64x2_t v20 = v42;
      float64x2_t v19 = v47;
      v17.f64[0] = a3;
      double v16 = a4;
      double v22 = v32;
      double v15 = v33;
      double v21 = v14 - a11;
      goto LABEL_14;
    case 9:
      float64x2_t v43 = v20;
      float64x2_t v48 = v19;
      PXRectGetCenter();
      PXRectWithCenterAndSize();
      float64x2_t v20 = v43;
      float64x2_t v19 = v48;
      v17.f64[0] = a3;
      double v16 = a4;
LABEL_12:
      double v21 = v25;
LABEL_13:
      double v15 = v26;
LABEL_14:
      double v14 = v27;
      break;
    case 10:
      double v14 = a11;
      double v15 = a10;
      double v21 = a9;
      goto LABEL_19;
    case 11:
      double v22 = a5 - a10;
      double v14 = a11;
      double v15 = a10;
      double v21 = a9;
      break;
    case 12:
      double v22 = a5 - a10;
      double v21 = a6 - a11;
      double v14 = a11;
      double v15 = a10;
      break;
    case 13:
      double v21 = a6 - a11;
      double v14 = a11;
      double v15 = a10;
LABEL_19:
      double v22 = a8;
      break;
    default:
      double v22 = 0.0;
      break;
  }
  double result = 0.0;
  *(float *)&uint64_t v35 = v22 * a7;
  float v36 = v21 * a7;
  *((float *)&v35 + 1) = v36;
  *(float *)&uint64_t v37 = v15 * a7;
  float v38 = v14 * a7;
  *((float *)&v37 + 1) = v38;
  *(void *)a2 = v35;
  *(void *)(a2 + 8) = v37;
  v17.f64[1] = v16;
  *(_OWORD *)(a2 + 16) = 0u;
  *(float32x2_t *)(a2 + 16) = vcvt_f32_f64(v17);
  *(float32x4_t *)(a2 + 32) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v20), v19);
  *(_OWORD *)(a2 + 48) = 0u;
  *(_DWORD *)(a2 + 48) = a13;
  return result;
}

void sub_2603A46B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *_PXGArrayRemoveRange(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = a5 + a4;
  unint64_t v9 = a3 - (a5 + a4);
  if (a3 < a5 + a4)
  {
    BOOL v11 = [MEMORY[0x263F08690] currentHandler];
    BOOL v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PXGArrayRemoveRange(void * _Nonnull, size_t, size_t, size_t, size_t)");
    [v11 handleFailureInFunction:v12, @"PXGArrayUtilities.m", 39, @"Invalid parameter not satisfying: %@", @"location + length <= count" file lineNumber description];
  }

  return memmove((void *)(a1 + a4 * a2), (const void *)(a1 + v8 * a2), v9 * a2);
}

void *_PXGArrayInsertRange(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = a5 + a4;
  unint64_t v9 = a3 - (a5 + a4);
  if (a3 < a5 + a4)
  {
    BOOL v11 = [MEMORY[0x263F08690] currentHandler];
    BOOL v12 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PXGArrayInsertRange(void * _Nonnull, size_t, size_t, size_t, size_t)");
    [v11 handleFailureInFunction:v12, @"PXGArrayUtilities.m", 34, @"Invalid parameter not satisfying: %@", @"location + length <= count" file lineNumber description];
  }

  return memmove((void *)(a1 + v8 * a2), (const void *)(a1 + a4 * a2), v9 * a2);
}

double PXGSpriteTextureInfoOrientationFromCGAffineTransform(float64x2_t *a1)
{
  *(void *)&double result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*a1), a1[1]).u64[0];
  return result;
}

float64x2_t PXGSpriteTextureInfoOrientationToCGAffineTransform@<Q0>(uint64_t a1@<X8>, float32x4_t a2@<Q0>)
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)a2.f32);
  float64x2_t result = vcvt_hight_f64_f32(a2);
  *(float64x2_t *)a1 = v2;
  *(float64x2_t *)(a1 + 16) = result;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  return result;
}

uint64_t PXGCGImageGetOpaque(CGImage *a1)
{
  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(a1);
  return (AlphaInfo < kCGImageAlphaOnly) & (0x61u >> AlphaInfo);
}

void *_PXGArrayResize(void **a1, uint64_t a2, uint64_t a3)
{
  float64x2_t result = malloc_type_realloc(*a1, a3 * a2, 0xFA539D40uLL);
  *a1 = result;
  return result;
}

__n128 PXGSpriteTextureInfoOrientationFromCGOrientation(int a1)
{
  if (PXGSpriteTextureInfoOrientationFromCGOrientation_onceToken != -1) {
    dispatch_once(&PXGSpriteTextureInfoOrientationFromCGOrientation_onceToken, &__block_literal_global_1520);
  }
  return (__n128)PXGSpriteTextureInfoOrientationFromCGOrientation_transforms[a1];
}

float64_t PXGCameraForVisibleRect(float64x2_t a1, float64_t a2, float64x2_t a3, float64_t a4)
{
  a3.f64[1] = a4;
  __asm { FMOV            V3.2D, #0.5 }
  a1.f64[1] = a2;
  *(float32x2_t *)&a1.f64[0] = vcvt_f32_f64(vaddq_f64(a1, vmulq_f64(a3, _Q3)));
  return a1.f64[0];
}

uint64_t PXGRequiresColorMatching(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a2 && a1 && a1 != a2)
  {
    if (CGColorSpaceIsUncalibrated()) {
      return 0;
    }
    PXGetColorSpace();
    if (CGColorSpaceEqualToColorSpaceIgnoringRange()
      && ((PXGetColorSpace(), (CGColorSpaceEqualToColorSpaceIgnoringRange() & 1) != 0)
       || CGColorSpaceGetType() < 2))
    {
      return 0;
    }
    else
    {
      return CGColorSpaceEqualToColorSpaceIgnoringRange() ^ 1;
    }
  }
  return result;
}

unint64_t PXGSectionedSpriteTagMake(unsigned int a1, _DWORD *a2)
{
  return (*a2 << 8) | (a2[2] << 16) | a1 | 0xFFFFFFFF00000000;
}

uint64_t PXGColorSpaceSupportsExtendedRange()
{
  return MEMORY[0x270F53FC0]();
}

uint64_t PXGDeviceIsKnownToHaveExtendedColorDisplay()
{
  if (PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken != -1) {
    dispatch_once(&PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken, &__block_literal_global_506);
  }
  return PXGDeviceIsKnownToHaveExtendedColorDisplay_hasExtendedColorDisplay;
}

uint64_t PXUpdateSectionedSpriteInfoTagsForItemsInRange(uint64_t result, char a2, __int16 a3, int a4, uint64_t a5)
{
  if (a5)
  {
    BOOL v5 = (_DWORD *)(result + 28);
    do
    {
      *((unsigned char *)v5 - 3) = a2;
      *BOOL v5 = a4++;
      *((_WORD *)v5 - 1) = a3;
      v5 += 10;
      --a5;
    }
    while (a5);
  }
  return result;
}

void _PXGArrayZeroRange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void __PXGPlaceholderImageWithColor_block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v11 = *(_OWORD *)(a1 + 48);
  v14[0] = *(_OWORD *)(a1 + 32);
  v14[1] = v11;
  BOOL v12 = (CGColorSpace *)PXGetColorSpace();
  BOOL v13 = CGColorCreate(v12, (const CGFloat *)v14);
  CGContextSetFillColorWithColor(a2, v13);
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  CGContextFillRect(a2, v16);
  CGColorRelease(v13);
}

uint64_t __PXGDeviceIsKnownToHaveExtendedColorDisplay_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  PXGDeviceIsKnownToHaveExtendedColorDisplay_hasExtendedColorDisplay = result;
  return result;
}

void sub_2603A84E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PXGLightPlaceholderImage()
{
  return PXCreateCGImageWithDrawBlock();
}

uint64_t PXGDarkPlaceholderImage()
{
  return PXCreateCGImageWithDrawBlock();
}

double __PXGSpriteTextureInfoOrientationFromCGOrientation_block_invoke()
{
  PXGSpriteTextureInfoOrientationFromCGOrientation_transforms = xmmword_2603C3570;
  unk_26B3E7E20 = xmmword_2603C3570;
  xmmword_26B3E7E30 = xmmword_2603C35A0;
  unk_26B3E7E40 = xmmword_2603C35B0;
  xmmword_26B3E7E50 = xmmword_2603C35C0;
  unk_26B3E7E60 = xmmword_2603C35D0;
  xmmword_26B3E7E70 = xmmword_2603C35E0;
  unk_26B3E7E80 = xmmword_2603C35F0;
  double result = 0.0078125;
  xmmword_26B3E7E90 = xmmword_2603C3600;
  return result;
}

uint64_t PXGColorSpaceNameFromCFStringRef(uint64_t a1)
{
  if (*MEMORY[0x263F002E8] == a1) {
    return 1;
  }
  if (*MEMORY[0x263F002F0] == a1) {
    return 2;
  }
  if (*MEMORY[0x263F00250] == a1) {
    return 3;
  }
  if (*MEMORY[0x263F00240] == a1) {
    return 4;
  }
  if (*MEMORY[0x263F001E8] == a1) {
    return 5;
  }
  if (*MEMORY[0x263F001E0] == a1) {
    return 6;
  }
  if (*MEMORY[0x263F00298] == a1) {
    return 7;
  }
  if (*MEMORY[0x263F00278] == a1) {
    return 8;
  }
  if (*MEMORY[0x263F00218] == a1) {
    return 9;
  }
  if (*MEMORY[0x263F00230] == a1) {
    return 10;
  }
  if (*MEMORY[0x263F00238] == a1) {
    return 11;
  }
  if (*MEMORY[0x263F002D8] == a1) {
    return 12;
  }
  return 0;
}

uint64_t dispatch thunk of CarouselDataSource.numberOfPages.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of CarouselViewModel.dataSource.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

BOOL _PXGArrayCapacityResizeToCount(void **a1, uint64_t a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v5 = *a3;
  if (*a3 < a4)
  {
    unint64_t v6 = a4;
    if (v5)
    {
      unint64_t v6 = *a3;
      do
        v6 *= 2;
      while (v6 < a4);
    }
    *a3 = v6;
    *a1 = malloc_type_realloc(*a1, v6 * a2, 0xFA539D40uLL);
  }
  return v5 < a4;
}

void *_PXGArrayCopyRange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return memmove((void *)(a1 + a5 * a2), (const void *)(a1 + a3 * a2), a4 * a2);
}

void *_PXGArrayCopyRangeToArray(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return memmove((void *)(a5 + a6 * a2), (const void *)(a1 + a3 * a2), a4 * a2);
}

void sub_2603AAC80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2603AB84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2603AC0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

float factorize(int a1, int a2, _WORD *a3, float a4)
{
  v19[1] = *MEMORY[0x263EF8340];
  if (a4 <= 0.0) {
    __assert_rtn("factorize", "PXGPolarBlurKernel.m", 22, "value > 0.0f");
  }
  if (a1 <= 0) {
    __assert_rtn("factorize", "PXGPolarBlurKernel.m", 23, "n > 0");
  }
  int v4 = a2;
  if (a2 <= 2) {
    __assert_rtn("factorize", "PXGPolarBlurKernel.m", 24, "pMin <= pMax");
  }
  if (!a3) {
    __assert_rtn("factorize", "PXGPolarBlurKernel.m", 25, "products != NULL");
  }
  if (a1 == 1)
  {
    int v7 = llroundf(a4);
    if (v7 >= a2) {
      int v7 = a2;
    }
    if (v7 <= 3) {
      LOWORD(v7) = 3;
    }
    *a3 = v7;
    return (float)(__int16)v7;
  }
  else
  {
    MEMORY[0x270FA5388]();
    BOOL v10 = (char *)v19 - v9;
    size_t v12 = 2 * v11;
    float v8 = 0.0;
    float v13 = 3.4028e38;
    uint64_t v14 = (__int16)v11;
    do
    {
      float v15 = factorize(v14, (__int16)v4, v10, a4 / (float)v4) * (float)v4;
      float v16 = vabds_f32(a4, v15);
      if (v16 < v13)
      {
        *a3 = v4;
        memcpy(a3 + 1, v10, v12);
        float v8 = v15;
        float v13 = v16;
      }
    }
    while (v4-- > 3);
  }
  return v8;
}

id PXGTungstenGetLog()
{
  if (PXGTungstenGetLog_predicate != -1) {
    dispatch_once(&PXGTungstenGetLog_predicate, &__block_literal_global_374);
  }
  v0 = (void *)PXGTungstenGetLog_log;

  return v0;
}

uint64_t __PXGTungstenGetLog_block_invoke()
{
  PXGTungstenGetLog_log = (uint64_t)os_log_create((const char *)*MEMORY[0x263F5D540], "Tungsten");

  return MEMORY[0x270F9A758]();
}

double PXGResizeRect(unsigned int a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  switch(a1 & 7)
  {
    case 1u:
      double v18 = a10 + a12 - a6 - a8;
      goto LABEL_6;
    case 2u:
      double v18 = a10 - a6;
      a4 = a4 + a12 - a8;
      goto LABEL_6;
    case 4u:
      double v18 = a10 - a6;
      goto LABEL_6;
    case 5u:
      double v18 = a10 - a6 + (a12 - a8) * 0.5;
LABEL_6:
      switch(((unint64_t)(a1 & 0x38) - 8) >> 3)
      {
        case 0uLL:
        case 1uLL:
        case 3uLL:
        case 4uLL:
          return a2 + v18;
        default:
          double v21 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a2, a3, a4, a5, v18, a7, a11);
          double v22 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PXGLinearResize(CGFloat *, CGFloat *, CGFloat, CGFloat, CGFloat, CGFloat, BOOL, BOOL, BOOL)");
          uint64_t v23 = (a1 >> 3) & 1;
          uint64_t v24 = (a1 >> 4) & 1;
          uint64_t v25 = (a1 >> 5) & 1;
          break;
      }
      break;
    default:
      double v21 = [MEMORY[0x263F08690] currentHandler];
      double v22 = objc_msgSend(NSString, "stringWithUTF8String:", "void _PXGLinearResize(CGFloat *, CGFloat *, CGFloat, CGFloat, CGFloat, CGFloat, BOOL, BOOL, BOOL)");
      uint64_t v23 = a1 & 1;
      uint64_t v24 = (a1 >> 1) & 1;
      uint64_t v25 = (a1 >> 2) & 1;
      break;
  }
  objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PXGGeometry.m", 26, @"resizing options (%i %i %i) not implemented yet", v23, v24, v25);

  abort();
}

uint64_t PXGGetColorSpaceName()
{
  return MEMORY[0x270F54038]();
}

uint64_t PXGColorSpaceIsGrayscale()
{
  return MEMORY[0x270F53FB8]();
}

CGColorSpace *PXGGetReconciledColorSpace(CGColorSpace *a1)
{
  unint64_t v1 = a1;
  if (!a1)
  {
    int v4 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v5 = [NSString stringWithUTF8String:"CGColorSpaceRef  _Nullable PXGGetReconciledColorSpace(CGColorSpaceRef _Nonnull)"];
    [v4 handleFailureInFunction:v5, @"PXGTextureUtilities.m", 169, @"Invalid parameter not satisfying: %@", @"space != nil" file lineNumber description];
  }
  switch(CGColorSpaceGetType())
  {
    case 0u:
    case 1u:
    case 2u:
      uint64_t AlternateColorSpace = PXGetColorSpace();
      goto LABEL_6;
    case 8u:
      uint64_t AlternateColorSpace = CGColorSpaceGetAlternateColorSpace();
LABEL_6:
      unint64_t v1 = (CGColorSpace *)AlternateColorSpace;
      break;
    default:
      break;
  }
  if (!CGColorSpaceSupportsOutput(v1))
  {
    unint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    int v7 = [NSString stringWithUTF8String:"CGColorSpaceRef  _Nullable PXGGetReconciledColorSpace(CGColorSpaceRef _Nonnull)"];
    [v6 handleFailureInFunction:v7, @"PXGTextureUtilities.m", 188, @"Color space not supported as output:%@", v1 file lineNumber description];
  }
  return v1;
}

CGColorRef PXGCreateDebugColorForMediaKind(CGColorRef result)
{
  switch((int)result)
  {
    case 0:
      CGFloat v1 = 1.0;
      CGFloat v2 = 0.0;
      CGFloat v3 = 0.0;
      goto LABEL_24;
    case 1:
      CGFloat v3 = 0.6;
      CGFloat v4 = 0.7;
      CGFloat v1 = 0.0;
      CGFloat v2 = 0.0;
      goto LABEL_4;
    case 2:
      CGFloat v4 = 0.4;
      goto LABEL_13;
    case 3:
      return CGColorCreateSRGB(0.5, 0.0, 0.5, 0.7);
    case 4:
      CGFloat v2 = 0.8;
      CGFloat v4 = 0.7;
      CGFloat v1 = 0.0;
      goto LABEL_19;
    case 5:
      CGFloat v2 = 0.4;
      goto LABEL_11;
    case 6:
      CGFloat v2 = 0.6;
LABEL_11:
      CGFloat v4 = 0.7;
      CGFloat v1 = 0.0;
      goto LABEL_16;
    case 7:
      CGFloat v4 = 0.2;
LABEL_13:
      CGFloat v1 = 0.0;
      goto LABEL_18;
    case 8:
      CGFloat v4 = 0.7;
      CGFloat v1 = 0.5;
      CGFloat v2 = 0.5;
      goto LABEL_19;
    case 9:
      CGFloat v2 = 0.2;
      CGFloat v4 = 0.7;
      CGFloat v1 = 0.5;
LABEL_16:
      CGFloat v3 = v2;
      goto LABEL_4;
    case 10:
      CGFloat v4 = 0.7;
      CGFloat v1 = 0.5;
LABEL_18:
      CGFloat v2 = 0.0;
LABEL_19:
      CGFloat v3 = 0.0;
      goto LABEL_4;
    case 11:
      return CGColorCreateSRGB(1.0, 0.7, 0.8, 0.7);
    case 12:
      CGFloat v1 = 0.0;
      goto LABEL_23;
    case 13:
      CGFloat v1 = 0.5;
LABEL_23:
      CGFloat v2 = 0.0;
      CGFloat v3 = 1.0;
LABEL_24:
      CGFloat v4 = 1.0;
LABEL_4:
      double result = CGColorCreateSRGB(v1, v2, v3, v4);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t PXGCreateContextWithAutomaticFormat()
{
  return MEMORY[0x270F53FD8]();
}

id PXGStringForOSType(unsigned int a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v3[0] = HIBYTE(a1);
  v3[1] = BYTE2(a1);
  v3[2] = BYTE1(a1);
  v3[3] = a1;
  CGFloat v1 = [NSString stringWithCharacters:v3 length:4];

  return v1;
}

uint64_t fourcc_compressed_of_type(uint64_t a1)
{
  uint64_t v1 = 1111970369;
  if ((int)a1 > 792225327)
  {
    if ((int)a1 > 1534359087)
    {
      if ((int)a1 <= 1534621233)
      {
        if ((int)a1 <= 1534617135)
        {
          if (a1 == 1534359088) {
            return 1953903152;
          }
          if (a1 == 1534359090) {
            return 1953903154;
          }
          if (a1 != 1534359092) {
            return a1;
          }
          int v5 = 1953903154;
        }
        else
        {
          if ((int)a1 <= 1534617139)
          {
            if (a1 != 1534617136)
            {
              if (a1 != 1534617138) {
                return a1;
              }
              return 2019963442;
            }
            int v10 = 2016686640;
            return (v10 + 3276800);
          }
          if (a1 != 1534617140)
          {
            if (a1 == 1534621232) {
              return 2016686640;
            }
            return a1;
          }
          int v5 = 2019963442;
        }
        return (v5 + 514);
      }
      if ((int)a1 <= 2084075055)
      {
        if (a1 == 1534621234)
        {
          int v11 = 2016686640;
          return v11 | 2u;
        }
        if (a1 != 1534621236)
        {
          int v8 = 2084070960;
LABEL_75:
          if (a1 != v8) {
            return a1;
          }
          return 875704422;
        }
        int v9 = 2016686640;
        return (v9 + 516);
      }
      if ((int)a1 > 2088265263)
      {
        if (a1 != 2088265264)
        {
          int v3 = 2088269360;
LABEL_101:
          if (a1 == v3) {
            return 1882468912;
          }
          return a1;
        }
LABEL_103:
        int v10 = 1882468912;
        return (v10 + 3276800);
      }
      if (a1 != 2084075056)
      {
        int v4 = 2084718401;
        goto LABEL_79;
      }
    }
    else
    {
      if ((int)a1 > 1530422835)
      {
        if ((int)a1 <= 1530426931)
        {
          if (a1 != 1530422836)
          {
            if (a1 != 1530426928)
            {
              int v2 = 1530426930;
LABEL_66:
              if (a1 == v2) {
                return 875704950;
              }
              return a1;
            }
            goto LABEL_68;
          }
          return 875836518;
        }
        if ((int)a1 <= 1534354993)
        {
          if (a1 == 1530426932) {
            goto LABEL_105;
          }
          if (a1 != 1534354992) {
            return a1;
          }
          return 1952854576;
        }
        if (a1 == 1534354994)
        {
          int v11 = 1952854576;
          return v11 | 2u;
        }
        if (a1 != 1534354996) {
          return a1;
        }
        int v9 = 1952854576;
        return (v9 + 516);
      }
      if ((int)a1 > 796419631)
      {
        if ((int)a1 > 1530422831)
        {
          if (a1 != 1530422832)
          {
            if (a1 != 1530422834) {
              return a1;
            }
            return 875704934;
          }
          return 875704422;
        }
        if (a1 != 796419632)
        {
          int v3 = 796423728;
          goto LABEL_101;
        }
        goto LABEL_103;
      }
      if (a1 == 792225328) {
        return 875704422;
      }
      if (a1 != 792229424)
      {
        int v4 = 792872769;
        goto LABEL_79;
      }
    }
LABEL_68:
    int v7 = 875704422;
    return v7 | 0x10u;
  }
  if ((int)a1 <= 645166643)
  {
    if ((int)a1 <= 642934848)
    {
      if ((int)a1 > 641234479)
      {
        if ((int)a1 <= 641234483)
        {
          if (a1 != 641234480)
          {
            int v2 = 641234482;
            goto LABEL_66;
          }
          goto LABEL_68;
        }
        if (a1 != 641234484)
        {
          int v4 = 641877825;
LABEL_79:
          if (a1 == v4) {
            return v1;
          }
          return a1;
        }
LABEL_105:
        int v7 = 875836518;
        return v7 | 0x10u;
      }
      if (a1 != 641230384)
      {
        if (a1 != 641230386)
        {
          if (a1 != 641230388) {
            return a1;
          }
          return 875836518;
        }
        return 875704934;
      }
      return 875704422;
    }
    if ((int)a1 <= 645162545)
    {
      if (a1 == 642934849) {
        return 1380411457;
      }
      if (a1 == 643969848) {
        return 1647534392;
      }
      if (a1 != 645162544) {
        return a1;
      }
      unsigned __int16 v6 = 26160;
    }
    else
    {
      if ((int)a1 <= 645166639)
      {
        if (a1 != 645162546)
        {
          if (a1 != 645162548) {
            return a1;
          }
          return 1886676532;
        }
        int v11 = 1886676528;
        return v11 | 2u;
      }
      if (a1 == 645166640) {
        return 1886680624;
      }
      if (a1 != 645166642) {
        return a1;
      }
      unsigned __int16 v6 = 30258;
    }
    return v6 | 0x70740000u;
  }
  if ((int)a1 > 645428785)
  {
    if ((int)a1 > 758674991)
    {
      if ((int)a1 <= 762865199)
      {
        if (a1 != 758674992)
        {
          int v4 = 759318337;
          goto LABEL_79;
        }
        goto LABEL_68;
      }
      if (a1 != 762865200)
      {
        int v3 = 762869296;
        goto LABEL_101;
      }
      goto LABEL_103;
    }
    if (a1 == 645428786)
    {
      int v11 = 1882468912;
      return v11 | 2u;
    }
    if (a1 != 645428788)
    {
      int v8 = 758670896;
      goto LABEL_75;
    }
    int v9 = 1882468912;
    return (v9 + 516);
  }
  if ((int)a1 > 645424687)
  {
    if ((int)a1 <= 645424691)
    {
      if (a1 != 645424688)
      {
        if (a1 != 645424690) {
          return a1;
        }
        return 1885745714;
      }
      goto LABEL_103;
    }
    if (a1 != 645424692)
    {
      int v3 = 645428784;
      goto LABEL_101;
    }
    int v5 = 1885745714;
    return (v5 + 514);
  }
  if (a1 == 645166644) {
    return 1886680628;
  }
  if (a1 == 645346162) {
    return 1999843442;
  }
  if (a1 != 645346401) {
    return a1;
  }
  return 1999908961;
}

uint64_t ycbcr_fourcc_is_video_range(int a1)
{
  uint64_t result = 1;
  if (a1 <= 1953903153)
  {
    if (a1 <= 1882468913)
    {
      if (a1 <= 875704949)
      {
        if (a1 == 846624121) {
          return result;
        }
        int v6 = 875704438;
        goto LABEL_32;
      }
      if (a1 == 875704950 || a1 == 875836534) {
        return result;
      }
      unsigned __int16 v5 = 12848;
    }
    else
    {
      if (a1 > 1886680623)
      {
        if ((a1 - 1886680624) > 4 || ((1 << (a1 - 48)) & 0x15) == 0)
        {
          unsigned __int16 v3 = 12848;
LABEL_28:
          int v6 = v3 | 0x74760000;
          goto LABEL_32;
        }
        return result;
      }
      if (a1 == 1882468914) {
        return result;
      }
      unsigned __int16 v5 = 13364;
    }
    int v6 = v5 | 0x70340000;
LABEL_32:
    if (a1 != v6) {
      return 0;
    }
    return result;
  }
  if (a1 > 2016686641)
  {
    if (a1 > 2033463605)
    {
      if (a1 != 2033463606 && a1 != 2033463856)
      {
        int v6 = 2037741171;
        goto LABEL_32;
      }
      return result;
    }
    if (a1 == 2016686642 || a1 == 2016687156) {
      return result;
    }
    unsigned __int16 v4 = 13424;
LABEL_20:
    int v6 = v4 | 0x78340000;
    goto LABEL_32;
  }
  if (a1 <= 1982882103)
  {
    if (a1 == 1953903154) {
      return result;
    }
    unsigned __int16 v3 = 13364;
    goto LABEL_28;
  }
  if (a1 != 1982882104 && a1 != 1983000886)
  {
    unsigned __int16 v4 = 12848;
    goto LABEL_20;
  }
  return result;
}

uint64_t ycbcr_fourcc_bits_per_component(uint64_t a1)
{
  int v1 = fourcc_compressed_of_type(a1);
  uint64_t v2 = 8;
  if (v1 > 1952854575)
  {
    if (v1 > 2016687155)
    {
      if (v1 <= 2019964015)
      {
        if (v1 > 2019963439)
        {
          if (v1 == 2019963440 || v1 == 2019963442) {
            return 10;
          }
          int v6 = 2019963956;
LABEL_52:
          if (v1 == v6) {
            return 10;
          }
          return 0;
        }
        if (v1 == 2016687156) {
          return 10;
        }
        unsigned __int16 v7 = 13424;
LABEL_51:
        int v6 = v7 | 0x78340000;
        goto LABEL_52;
      }
      if (v1 > 2033463855)
      {
        if (v1 == 2033463856 || v1 == 2037741158) {
          return v2;
        }
        int v8 = 2037741171;
        goto LABEL_58;
      }
      if (v1 == 2019964016) {
        return 10;
      }
      if (v1 != 2033463606) {
        return 0;
      }
    }
    else
    {
      if (v1 <= 1953903667)
      {
        if (v1 <= 1952855091)
        {
          if (v1 == 1952854576) {
            return 12;
          }
          int v4 = 1952854578;
        }
        else
        {
          if (v1 == 1952855092 || v1 == 1953903152) {
            return 12;
          }
          int v4 = 1953903154;
        }
        if (v1 != v4) {
          return 0;
        }
        return 12;
      }
      if (v1 <= 1983000885)
      {
        if (v1 != 1953903668)
        {
          int v8 = 1982882104;
          goto LABEL_58;
        }
        return 12;
      }
      if (v1 != 1983000886)
      {
        if (v1 == 2016686640) {
          return 10;
        }
        unsigned __int16 v7 = 12850;
        goto LABEL_51;
      }
    }
    return 16;
  }
  if (v1 > 1882469427)
  {
    if (v1 <= 1885746227)
    {
      if (v1 == 1882469428 || v1 == 1885745712) {
        return 10;
      }
      unsigned __int16 v5 = 12850;
      goto LABEL_39;
    }
    if (((v1 - 1886676528) > 4 || ((1 << (v1 - 48)) & 0x15) == 0)
      && ((v1 - 1886680624) > 4 || ((1 << (v1 - 48)) & 0x15) == 0))
    {
      unsigned __int16 v5 = 13364;
LABEL_39:
      int v6 = v5 | 0x70660000;
      goto LABEL_52;
    }
    return 12;
  }
  if (v1 <= 875836517)
  {
    if (v1 <= 875704437)
    {
      if (v1 == 846624121) {
        return v2;
      }
      unsigned __int16 v3 = 12390;
    }
    else
    {
      if (v1 == 875704438 || v1 == 875704934) {
        return v2;
      }
      unsigned __int16 v3 = 12918;
    }
    int v8 = v3 | 0x34320000;
    goto LABEL_58;
  }
  if (v1 > 1714696751)
  {
    if (v1 == 1714696752) {
      return v2;
    }
    if (v1 != 1882468912)
    {
      int v6 = 1882468914;
      goto LABEL_52;
    }
    return 10;
  }
  if (v1 == 875836518) {
    return v2;
  }
  int v8 = 875836534;
LABEL_58:
  if (v1 != v8) {
    return 0;
  }
  return v2;
}

uint64_t PXGCGImageHasExtendedRange(CGImage *a1)
{
  ColorSpace = CGImageGetColorSpace(a1);
  uint64_t v2 = CGColorSpaceGetName(ColorSpace);
  if ([v2 isEqualToString:*MEMORY[0x263F002D8]]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F00250]] ^ 1;
  }

  return v3;
}

CGImageRef PXGMetalCompatibleImageByRedrawingCGImage(CGImageRef image, double a2, double a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (!image)
  {
    double v18 = [MEMORY[0x263F08690] currentHandler];
    float64x2_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", "CGImageRef  _Nullable PXGMetalCompatibleImageByRedrawingCGImage(CGImageRef _Nonnull, CGSize, PXGColorSpaceName, BOOL)");
    [v18 handleFailureInFunction:v19, @"PXGTextureUtilities.m", 606, @"Invalid parameter not satisfying: %@", @"imageRef != nil" file lineNumber description];
  }
  double Width = (double)CGImageGetWidth(image);
  double Height = (double)CGImageGetHeight(image);
  if (a2 <= Width || a3 <= Height)
  {
    PXSizeMin();
    uint64_t AspectRatio = PXSizeGetAspectRatio();
    double Width = MEMORY[0x26120F550](AspectRatio);
    double Height = v10;
  }
  CGImageGetAlphaInfo(image);
  int v11 = (CGContext *)PXCreateContext();
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = Width;
  v23.size.height = Height;
  CGContextClearRect(v11, v23);
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = Width;
  v24.size.height = Height;
  CGContextDrawImage(v11, v24, image);
  size_t v12 = +[PXTungstenSettings sharedInstance];
  int v13 = [v12 colorCopiedImages];

  if (v13)
  {
    *(_OWORD *)components = xmmword_2603C37B8;
    long long v21 = unk_2603C37C8;
    uint64_t v14 = (CGColorSpace *)PXGetColorSpace();
    float v15 = CGColorCreate(v14, components);
    CGContextSetFillColorWithColor(v11, v15);
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = Width;
    v25.size.height = Height;
    CGContextFillRect(v11, v25);
    CGColorRelease(v15);
  }
  CGImageRef v16 = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  if (v16) {
    CFAutorelease(v16);
  }
  return v16;
}

uint64_t __Block_byref_object_copy__513(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__514(uint64_t a1)
{
}

void __PXGCreateMetalTextureFromBytesInCGImage_block_invoke(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  size_t v12 = (void *)MEMORY[0x26120F770]();
  uint64_t v13 = *(void *)(a1 + 56);
  uint64_t v14 = [*(id *)(a1 + 32) device];
  float v15 = _createMetal2DTextureDescriptorWithPixelFormat(v13, 0, (double)a2, (double)a3);

  if (*(unsigned char *)(a1 + 72))
  {
    CGImageRef v16 = [*(id *)(a1 + 32) device];
    float64x2_t v17 = (void *)[v16 newTextureLayoutWithDescriptor:v15 isHeapOrBufferBacked:0];

    if ([v17 size] != a6)
    {
      float v38 = [MEMORY[0x263F08690] currentHandler];
      double v32 = objc_msgSend(NSString, "stringWithUTF8String:", "id<MTLTexture>  _Nullable PXGCreateMetalTextureFromBytesInCGImage(CGImageRef _Nonnull, PXGMetalRenderContext *__strong _Nonnull, PXGShaderFlags * _Nonnull)_block_invoke");
      [v38 handleFailureInFunction:v32 file:@"PXGTextureUtilities.m" lineNumber:716 description:@"Bad texture layout size for pre-twiddled data"];
    }
    if ((([v17 alignment] - 1) & a5) != 0)
    {
      float64x2_t v39 = [MEMORY[0x263F08690] currentHandler];
      double v33 = objc_msgSend(NSString, "stringWithUTF8String:", "id<MTLTexture>  _Nullable PXGCreateMetalTextureFromBytesInCGImage(CGImageRef _Nonnull, PXGMetalRenderContext *__strong _Nonnull, PXGShaderFlags * _Nonnull)_block_invoke");
      [v39 handleFailureInFunction:v33 file:@"PXGTextureUtilities.m" lineNumber:717 description:@"Bad data pointer alignment for pre-twiddled data"];
    }
    uint64_t v41 = [v17 watermark];
    long long v44 = *(_OWORD *)(a5 + a6 - 16);
    if (v41 != (void)v44 || v18 != *((void *)&v44 + 1))
    {
      float64x2_t v40 = [MEMORY[0x263F08690] currentHandler];
      int v34 = objc_msgSend(NSString, "stringWithUTF8String:", "id<MTLTexture>  _Nullable PXGCreateMetalTextureFromBytesInCGImage(CGImageRef _Nonnull, PXGMetalRenderContext *__strong _Nonnull, PXGShaderFlags * _Nonnull)_block_invoke");
      [v40 handleFailureInFunction:v34 file:@"PXGTextureUtilities.m" lineNumber:720 description:@"Bad pre-twiddled watermark (not pre-twiddled data?)"];
    }
    float64x2_t v20 = [*(id *)(a1 + 32) device];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __PXGCreateMetalTextureFromBytesInCGImage_block_invoke_2;
    v43[3] = &__block_descriptor_40_e12_v24__0_v8Q16l;
    v43[4] = *(void *)(a1 + 64);
    uint64_t v21 = [v20 newTextureWithBytesNoCopy:a5 length:a6 descriptor:v15 deallocator:v43];
    uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
    CGRect v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    else
    {
      unint64_t v24 = ((a3 + 3) >> 2) * a4;
      [MEMORY[0x263EFF990] dataWithLength:v24];
      memset(v42, 0, 24);
      v42[3] = a2;
      v42[4] = a3;
      v42[5] = 1;
      CGRect v25 = v12;
      uint64_t v26 = a4;
      id v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "copyFromTextureMemory:textureSlice:textureLevel:textureRegion:toLinearBytes:linearOffset:linearBytesPerRow:linearBytesPerImage:", a5, 0, 0, v42, objc_msgSend(v27, "mutableBytes"), 0, v26, v24);
      id v28 = v27;
      a5 = [v28 bytes];

      size_t v12 = v25;
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v29 = [*(id *)(a1 + 32) newTextureWithDescriptor:v15];
    uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
    double v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;

    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      uint64_t v35 = [MEMORY[0x263F08690] currentHandler];
      float v36 = objc_msgSend(NSString, "stringWithUTF8String:", "id<MTLTexture>  _Nullable PXGCreateMetalTextureFromBytesInCGImage(CGImageRef _Nonnull, PXGMetalRenderContext *__strong _Nonnull, PXGShaderFlags * _Nonnull)_block_invoke");
      uint64_t v37 = [*(id *)(a1 + 32) device];
      [v35 handleFailureInFunction:v36, @"PXGTextureUtilities.m", 748, @"Device:%@ failed to create texture:%@", v37, v15 file lineNumber description];
    }
    objc_msgSend(*(id *)(a1 + 32), "copyBytes:toTexture:inRegion:length:bytesPerRow:bytesPerImage:", a5);
  }
}

uint64_t __PXGCreateMetalTextureFromBytesInCGImage_block_invoke_2()
{
  return CGImageTextureDataRelease();
}

uint64_t __PXGDeviceIsVirtualMachine_block_invoke()
{
  uint64_t result = MGIsQuestionValid();
  if (result) {
    uint64_t result = MGGetBoolAnswer();
  }
  PXGDeviceIsVirtualMachine_isVirtualDevice = result;
  return result;
}

uint64_t PXGMetalPixelFormatStrippingSRGB(uint64_t a1)
{
  if (a1 == 204) {
    uint64_t v1 = 204;
  }
  else {
    uint64_t v1 = a1;
  }
  if (a1 == 186) {
    return 204;
  }
  else {
    return v1;
  }
}

BOOL PXGCGImageHasStraightAlpha(CGImage *a1)
{
  return CGImageGetAlphaInfo(a1) - 3 < 2;
}

uint64_t PXGMetalPixelFormatForCIImage()
{
  if (PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken != -1) {
    dispatch_once(&PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken, &__block_literal_global_506);
  }
  if (PXGDeviceIsKnownToHaveExtendedColorDisplay_hasExtendedColorDisplay) {
    return 554;
  }
  else {
    return 80;
  }
}

id PXGCreateMetalTextureToRenderCIImage(void *a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  unsigned __int16 v7 = [v6 device];
  uint64_t v8 = [v7 limits];
  LODWORD(v2) = *(_DWORD *)(v8 + 132);
  LODWORD(v3) = *(_DWORD *)(v8 + 136);

  if (PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken != -1) {
    dispatch_once(&PXGDeviceIsKnownToHaveExtendedColorDisplay_onceToken, &__block_literal_global_506);
  }
  if (PXGDeviceIsKnownToHaveExtendedColorDisplay_hasExtendedColorDisplay) {
    uint64_t v9 = 554;
  }
  else {
    uint64_t v9 = 80;
  }
  [v5 extent];
  double v11 = v10;
  double v13 = v12;
  if (PXSizeIsEmpty())
  {
    uint64_t v14 = PXGTungstenGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v30.width = v11;
      v30.height = v13;
      float v15 = NSStringFromCGSize(v30);
      CGImageRef v16 = [v6 device];
      int v22 = 138543874;
      id v23 = v5;
      __int16 v24 = 2114;
      CGRect v25 = v15;
      __int16 v26 = 2114;
      id v27 = v16;
      float64x2_t v17 = "Empty image %{public}@ with size %{public}@ for device:%{public}@";
LABEL_12:
      _os_log_impl(&dword_26039F000, v14, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v22, 0x20u);

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  double v18 = (double)v2;
  double v19 = (double)v3;
  if (MEMORY[0x26120F520](v11, v13, v18, v19))
  {
    uint64_t v14 = PXGTungstenGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v31.width = v18;
      v31.height = v19;
      float v15 = NSStringFromCGSize(v31);
      CGImageRef v16 = [v6 device];
      int v22 = 138543874;
      id v23 = v5;
      __int16 v24 = 2114;
      CGRect v25 = v15;
      __int16 v26 = 2114;
      id v27 = v16;
      float64x2_t v17 = "Too large image %{public}@ > %{public}@ for device:%{public}@";
      goto LABEL_12;
    }
LABEL_13:

    float64x2_t v20 = 0;
    goto LABEL_15;
  }
  float64x2_t v20 = _createMetal2DTextureWithPixelFormat(v9, v6, 1, v11, v13);
LABEL_15:

  return v20;
}

id PXGSupportedPixelBufferFormats()
{
  if (PXGSupportedPixelBufferFormats_onceToken != -1) {
    dispatch_once(&PXGSupportedPixelBufferFormats_onceToken, &__block_literal_global_62);
  }
  v0 = (void *)PXGSupportedPixelBufferFormats_supported;

  return v0;
}

void __PXGSupportedPixelBufferFormats_block_invoke()
{
  v35[3] = *MEMORY[0x263EF8340];
  if (PXGDeviceSupportsIOSurfaceCompression_onceToken != -1) {
    dispatch_once(&PXGDeviceSupportsIOSurfaceCompression_onceToken, &__block_literal_global_721);
  }
  if (PXGDeviceSupportsIOSurfaceCompression__supportsIOSurfaceCompression) {
    v0 = &unk_270C58990;
  }
  else {
    v0 = (void *)MEMORY[0x263EFFA68];
  }
  v35[0] = v0;
  v35[1] = &unk_270C58978;
  v35[2] = &unk_270C589A8;
  uint64_t v1 = (void *)MEMORY[0x263EFF8C0];
  id v2 = v0;
  unint64_t v3 = [v1 arrayWithObjects:v35 count:3];

  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v3;
  uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v6;
        unsigned __int16 v7 = *(void **)(*((void *)&v29 + 1) + 8 * v6);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              double v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              uint64_t v14 = [v13 unsignedIntValue];
              int v15 = v14;
              if (PXGMetalPixelFormatForOSType(v14))
              {
LABEL_31:
                if (([v5 containsObject:v13] & 1) == 0)
                {
                  [v4 addObject:v13];
                  [v5 addObject:v13];
                }
                continue;
              }
              if (v15 <= 875704421)
              {
                if (v15 == 32 || v15 == 846624121) {
                  goto LABEL_31;
                }
              }
              else if (v15 == 875704422 || v15 == 2016686640 || v15 == 875704438)
              {
                goto LABEL_31;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v10);
        }

        uint64_t v6 = v24 + 1;
      }
      while (v24 + 1 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }

  uint64_t v19 = [v4 copy];
  float64x2_t v20 = (void *)PXGSupportedPixelBufferFormats_supported;
  PXGSupportedPixelBufferFormats_supported = v19;
}

void __PXGDeviceSupportsIOSurfaceCompression_block_invoke()
{
  CFDictionaryRef v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    CFDictionaryRef v1 = v0;
    id v2 = (const void *)*MEMORY[0x263EFFB40];
    if (v2 == CFDictionaryGetValue(v0, @"universal-buffer-compression")) {
      PXGDeviceSupportsIOSurfaceCompression__supportsIOSurfaceCompression = 1;
    }
    CFRelease(v1);
  }
}

uint64_t PXGCreateMetalTexturesFromPixelBuffer(__CVBuffer *a1, void *a2, __CVMetalTextureCache *a3, NSObject **a4, void *a5, int *a6)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v11 = a2;
  int v29 = 0;
  IOSurface = CVPixelBufferGetIOSurface(a1);
  if (IOSurface)
  {
    uint64_t v13 = PXGCreateMetalTextureFromIOSurface(IOSurface, v11, &v29);
    if (v13) {
      goto LABEL_3;
    }
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  uint64_t v17 = 0;
  if (PixelFormatType <= 875704421)
  {
    if (PixelFormatType == 32) {
      goto LABEL_12;
    }
    int v19 = 846624121;
  }
  else
  {
    if (PixelFormatType == 875704422 || PixelFormatType == 2016686640) {
      goto LABEL_12;
    }
    int v19 = 875704438;
  }
  if (PixelFormatType != v19) {
    goto LABEL_41;
  }
LABEL_12:
  size_t PlaneCount = CVPixelBufferGetPlaneCount(a1);
  signed int v21 = CVPixelBufferGetPixelFormatType(a1);
  signed int v22 = v21;
  if (PlaneCount != 2)
  {
    if (PlaneCount || v21 != 32)
    {
      uint64_t v17 = 0;
      if (PlaneCount || v21 != 846624121) {
        goto LABEL_41;
      }
      CVMetalTextureCacheFlush(a3, 0);
      int v29 = _PXGShaderFlagsForYCbCrPixelBuffer(a1) | 0x10;
      uint64_t v13 = _createMetalTextureForPixelBufferPlane(a1, MTLPixelFormatBGRG422, 0, a3);
      if (!v13)
      {
        uint64_t v14 = PXAssertGetLog();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        *(_DWORD *)buf = 138412290;
        long long v31 = a1;
        goto LABEL_32;
      }
    }
    else
    {
      CVMetalTextureCacheFlush(a3, 0);
      int v29 = 1;
      uint64_t v13 = _createMetalTextureForPixelBufferPlane(a1, MTLPixelFormatRGBA8Unorm, 0, a3);
      if (!v13)
      {
        uint64_t v14 = PXAssertGetLog();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_39;
        }
        *(_DWORD *)buf = 138412290;
        long long v31 = a1;
LABEL_32:
        _os_log_error_impl(&dword_26039F000, v14, OS_LOG_TYPE_ERROR, "Unable to create texture for video pixelBuffer %@", buf, 0xCu);
        goto LABEL_39;
      }
    }
LABEL_3:
    uint64_t v14 = v13;
    int v15 = 0;
LABEL_4:
    uint64_t v14 = v14;
    *a4 = v14;
    id v16 = v15;
    *a5 = v16;
    *a6 = v29;

    uint64_t v17 = 1;
LABEL_40:

    goto LABEL_41;
  }
  uint64_t v17 = 0;
  if (v21 > 875704437)
  {
    if (v21 == 2016686640) {
      goto LABEL_24;
    }
    unsigned __int16 v23 = 12406;
  }
  else
  {
    if (v21 == 32) {
      goto LABEL_24;
    }
    unsigned __int16 v23 = 12390;
  }
  if (v21 == (v23 | 0x34320000))
  {
LABEL_24:
    CVMetalTextureCacheFlush(a3, 0);
    int v29 = _PXGShaderFlagsForYCbCrPixelBuffer(a1);
    if (v22 == 2016686640 || v22 == 32)
    {
      MTLPixelFormat v24 = MTLPixelFormatRG16Unorm;
      MTLPixelFormat v25 = MTLPixelFormatR16Unorm;
    }
    else
    {
      MTLPixelFormat v24 = MTLPixelFormatRG8Unorm;
      MTLPixelFormat v25 = MTLPixelFormatR8Unorm;
    }
    uint64_t v14 = _createMetalTextureForPixelBufferPlane(a1, v25, 0, a3);
    uint64_t v26 = _createMetalTextureForPixelBufferPlane(a1, v24, 1uLL, a3);
    int v15 = (void *)v26;
    if (v14 && v26) {
      goto LABEL_4;
    }
    long long v27 = PXAssertGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      long long v31 = a1;
      _os_log_error_impl(&dword_26039F000, v27, OS_LOG_TYPE_ERROR, "Unable to create texture for video pixelBuffer %@", buf, 0xCu);
    }

LABEL_39:
    uint64_t v17 = 0;
    goto LABEL_40;
  }
LABEL_41:

  return v17;
}

uint64_t _PXGShaderFlagsForYCbCrPixelBuffer(__CVBuffer *a1)
{
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  int v3 = PixelFormatType;
  uint64_t v4 = ycbcr_fourcc_bits_per_component(PixelFormatType);
  int is_video_range = ycbcr_fourcc_is_video_range(v3);
  if (is_video_range) {
    unsigned __int8 v6 = 1;
  }
  else {
    unsigned __int8 v6 = 2;
  }
  CFDictionaryRef Attributes = (const __CFDictionary *)CVPixelBufferGetAttributes();
  if (Attributes)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(Attributes, (const void *)*MEMORY[0x263F04178]);
    if (Value)
    {
      CFDictionaryRef v9 = Value;
      uint64_t v10 = CFDictionaryGetValue(Value, (const void *)*MEMORY[0x263F04268]);
      if (v10) {
        int is_video_range = CFEqual(v10, (CFTypeRef)*MEMORY[0x263F04270]) != 0;
      }
      id v11 = CFDictionaryGetValue(v9, (const void *)*MEMORY[0x263F04258]);
      double v12 = v11;
      if (v11) {
        uint64_t v4 = (int)[v11 intValue];
      }
    }
  }
  CFTypeRef v13 = CVBufferCopyAttachment(a1, (CFStringRef)*MEMORY[0x263F04020], 0);
  if (v13)
  {
    uint64_t v14 = v13;
    if (CFEqual(v13, (CFTypeRef)*MEMORY[0x263F04038]))
    {
      BOOL v15 = is_video_range == 0;
      char v16 = 1;
    }
    else if (CFEqual(v14, (CFTypeRef)*MEMORY[0x263F04050]))
    {
      BOOL v15 = is_video_range == 0;
      char v16 = 3;
    }
    else
    {
      if (!CFEqual(v14, (CFTypeRef)*MEMORY[0x263F04028]))
      {
        int v19 = CFEqual(v14, (CFTypeRef)*MEMORY[0x263F04060]);
        if (is_video_range) {
          char v20 = 7;
        }
        else {
          char v20 = 8;
        }
        if (v19) {
          unsigned __int8 v6 = v20;
        }
        goto LABEL_21;
      }
      BOOL v15 = is_video_range == 0;
      char v16 = 5;
    }
    if (v15) {
      unsigned __int8 v6 = v16 + 1;
    }
    else {
      unsigned __int8 v6 = v16;
    }
LABEL_21:
    CFRelease(v14);
  }
  if (v4 == 10) {
    int v17 = 0x2000;
  }
  else {
    int v17 = 4096;
  }
  return v17 | (v6 << 8);
}

id _createMetalTextureForPixelBufferPlane(__CVBuffer *a1, MTLPixelFormat a2, size_t planeIndex, __CVMetalTextureCache *a4)
{
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, planeIndex);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, planeIndex);
  CVMetalTextureRef image = 0;
  CVReturn v10 = CVMetalTextureCacheCreateTextureFromImage(0, a4, a1, 0, a2, WidthOfPlane, HeightOfPlane, planeIndex, &image);
  id v11 = 0;
  if (!v10)
  {
    id v11 = CVMetalTextureGetTexture(image);
  }
  CVBufferRelease(image);

  return v11;
}

uint64_t PXGPlaceholderImageWithColor()
{
  return PXCreateCGImageWithDrawBlock();
}

uint64_t PXGOffscreenMetalPixelFormatForDrawableFormat(uint64_t result, int a2)
{
  if (result <= 114)
  {
    if (result == 80) {
      return result;
    }
    if (result == 90)
    {
      BOOL v2 = a2 == 0;
      uint64_t v3 = 115;
      uint64_t v4 = 90;
LABEL_9:
      if (v2) {
        return v3;
      }
      else {
        return v4;
      }
    }
    return 80;
  }
  if (result != 115 && result != 552)
  {
    if (result == 554)
    {
      BOOL v2 = a2 == 0;
      uint64_t v3 = 552;
      uint64_t v4 = 554;
      goto LABEL_9;
    }
    return 80;
  }
  return result;
}

uint64_t PXGBytesPerPixelForMetalPixelFormat(uint64_t a1)
{
  uint64_t v2 = a1 - 1;
  uint64_t result = 1;
  switch(v2)
  {
    case 0:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 20:
    case 25:
    case 26:
    case 27:
    case 28:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 55:
    case 56:
    case 57:
    case 58:
    case 60:
    case 65:
    case 66:
    case 67:
    case 68:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 81:
    case 82:
    case 83:
    case 84:
    case 85:
    case 86:
    case 87:
    case 88:
    case 94:
    case 95:
    case 96:
    case 97:
    case 98:
    case 99:
    case 100:
    case 101:
    case 105:
    case 106:
    case 107:
    case 108:
    case 110:
    case 115:
    case 116:
    case 117:
    case 118:
    case 119:
    case 120:
    case 121:
      goto LABEL_6;
    case 19:
    case 21:
    case 22:
    case 23:
    case 24:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 39:
    case 40:
    case 41:
    case 42:
      return 2;
    case 52:
    case 53:
    case 54:
    case 59:
    case 61:
    case 62:
    case 63:
    case 64:
    case 69:
    case 70:
    case 71:
    case 72:
    case 73:
    case 79:
    case 80:
    case 89:
    case 90:
    case 91:
    case 92:
    case 93:
      return 4;
    case 102:
    case 103:
    case 104:
    case 109:
    case 111:
    case 112:
    case 113:
    case 114:
      return 8;
    case 122:
    case 123:
    case 124:
      return 16;
    default:
      if ((unint64_t)(a1 - 552) < 2) {
        return 8;
      }
      if ((unint64_t)(a1 - 554) >= 2)
      {
LABEL_6:
        uint64_t v4 = a1;
        id v5 = [MEMORY[0x263F08690] currentHandler];
        unsigned __int8 v6 = [NSString stringWithUTF8String:"NSUInteger PXGBytesPerPixelForMetalPixelFormat(MTLPixelFormat)"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"PXGTextureUtilities.m", 1873, @"Unsupported pixel format:%lu", v4);

        abort();
      }
      return 4;
  }
}

id PXGCreateIOSurface2DTexture(void *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v4 pixelFormat];
  uint64_t v6 = v5;
  unsigned __int16 v7 = 0;
  long long v31 = v3;
  if (v5 > 69)
  {
    if (v5 > 114)
    {
      if ((unint64_t)(v5 - 554) < 2)
      {
        uint64_t v8 = 1999843442;
        goto LABEL_42;
      }
      if (v5 == 115)
      {
        uint64_t v8 = 1380411457;
        goto LABEL_42;
      }
      if (v5 != 125) {
        goto LABEL_50;
      }
      unsigned __int16 v9 = 26177;
    }
    else
    {
      if (v5 > 89)
      {
        switch(v5)
        {
          case 'Z':
            uint64_t v8 = 1378955371;
            break;
          case '^':
            uint64_t v8 = 1815162994;
            break;
          case 'n':
            uint64_t v8 = 1815491698;
            break;
          default:
            goto LABEL_50;
        }
        goto LABEL_42;
      }
      if (v5 != 70)
      {
        if (v5 != 80) {
          goto LABEL_50;
        }
        uint64_t v8 = 1111970369;
        goto LABEL_42;
      }
      unsigned __int16 v9 = 16961;
    }
    uint64_t v8 = v9 | 0x52470000u;
  }
  else if (v5 <= 39)
  {
    if (v5 > 19)
    {
      if (v5 == 20)
      {
        uint64_t v8 = 1278226742;
      }
      else
      {
        if (v5 != 30) {
          goto LABEL_50;
        }
        uint64_t v8 = 1279340600;
      }
    }
    else if (v5 == 1)
    {
      uint64_t v8 = 1093677112;
    }
    else
    {
      if (v5 != 10) {
        goto LABEL_50;
      }
      uint64_t v8 = 1278226488;
    }
  }
  else if (v5 <= 42)
  {
    if (v5 == 40)
    {
      uint64_t v8 = 1278555701;
    }
    else
    {
      if (v5 != 42) {
        goto LABEL_50;
      }
      uint64_t v8 = 875836468;
    }
  }
  else
  {
    switch(v5)
    {
      case '+':
        uint64_t v8 = 1278555445;
        break;
      case '<':
        uint64_t v8 = 843264310;
        break;
      case 'A':
        uint64_t v8 = 843264104;
        break;
      default:
        goto LABEL_50;
    }
  }
LABEL_42:
  uint64_t v10 = *MEMORY[0x263F0EF50];
  unint64_t v11 = MEMORY[0x26120F280](*MEMORY[0x263F0EF50], [v4 width]);
  uint64_t v12 = *MEMORY[0x263F0EDF8];
  unint64_t v13 = MEMORY[0x26120F280](*MEMORY[0x263F0EDF8], [v4 height]);
  uint64_t v14 = PXGBytesPerPixelForMetalPixelFormat(v6);
  uint64_t v15 = *MEMORY[0x263F0ED50];
  unint64_t v16 = MEMORY[0x26120F280](*MEMORY[0x263F0ED50], v14 * v11);
  unint64_t v17 = MEMORY[0x26120F2F0](v10);
  unint64_t v18 = MEMORY[0x26120F2F0](v12);
  unint64_t v19 = MEMORY[0x26120F2F0](v15);
  int v20 = v19;
  if (v11 > v17 || v13 > v18 || v16 > v19)
  {
    long long v28 = PXGTungstenGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110400;
      int v35 = v11;
      __int16 v36 = 1024;
      int v37 = v13;
      __int16 v38 = 1024;
      int v39 = v17;
      __int16 v40 = 1024;
      int v41 = v18;
      __int16 v42 = 1024;
      int v43 = v16;
      __int16 v44 = 1024;
      int v45 = v20;
      _os_log_impl(&dword_26039F000, v28, OS_LOG_TYPE_DEFAULT, "Texture creation failed: exceeded IOSurface limits. size:(%u, %u) maxSize:(%u, %u) bytesPerRow:%u maxBytesPerRow:%u", buf, 0x26u);
    }
    unsigned __int16 v7 = 0;
    id v3 = v31;
  }
  else
  {
    unint64_t v21 = v16 * v13;
    v32[0] = *MEMORY[0x263F0ECF8];
    signed int v22 = [NSNumber numberWithUnsignedLong:v11];
    v33[0] = v22;
    v32[1] = *MEMORY[0x263F0ECC0];
    unsigned __int16 v23 = [NSNumber numberWithUnsignedLong:v13];
    v33[1] = v23;
    v32[2] = *MEMORY[0x263F0ECA0];
    MTLPixelFormat v24 = [NSNumber numberWithUnsignedLong:v14];
    v33[2] = v24;
    v32[3] = *MEMORY[0x263F0ECA8];
    MTLPixelFormat v25 = [NSNumber numberWithUnsignedLong:v16];
    v33[3] = v25;
    v32[4] = *MEMORY[0x263F0EC98];
    uint64_t v26 = [NSNumber numberWithUnsignedLong:v21];
    v33[4] = v26;
    v32[5] = *MEMORY[0x263F0ECC8];
    long long v27 = [NSNumber numberWithUnsignedInt:v8];
    v32[6] = @"kIOSurfaceName";
    v33[5] = v27;
    v33[6] = @"PXGIOSurface";
    long long v28 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:7];

    IOSurfaceRef v29 = IOSurfaceCreate((CFDictionaryRef)v28);
    id v3 = v31;
    unsigned __int16 v7 = (void *)[v31 newTextureWithDescriptor:v4 iosurface:v29 plane:0];
    CFRelease(v29);
  }

LABEL_50:

  return v7;
}

uint64_t PXGCreateBurstImageStackFromImage()
{
  return PXCreateCGImageWithDrawBlock();
}

void __PXGCreateBurstImageStackFromImage_block_invoke(uint64_t a1, CGContext *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v10 = *(double *)(a1 + 32);
  double v11 = v10 * 2.5;
  double v32 = v10 * 0.5;
  PXRectRoundToPixel();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  CGContextSetFillColorWithColor(a2, *(CGColorRef *)(a1 + 40));
  v33.origin.x = a3;
  v33.origin.y = a4;
  v33.size.width = a5;
  v33.size.height = a6;
  CGContextFillRect(a2, v33);
  CGImageGetWidth(*(CGImageRef *)(a1 + 48));
  CGImageGetHeight(*(CGImageRef *)(a1 + 48));
  PXSizeGetAspectRatioWithDefault();
  PXRectWithAspectRatioFillingRect();
  PXRectRoundToPixel();
  CGFloat v21 = v20;
  double v23 = v22;
  CGFloat v25 = v24;
  CGFloat rect = v26;
  v34.origin.x = v13;
  v34.origin.y = v15;
  v34.size.width = v17;
  v34.size.height = v19;
  CGContextClipToRect(a2, v34);
  v35.origin.x = v21;
  v35.origin.y = v23;
  v35.size.width = v25;
  v35.size.height = rect;
  CGContextDrawImage(a2, v35, *(CGImageRef *)(a1 + 48));
  CGContextResetClip(a2);
  CGContextSetAlpha(a2, 0.600000024);
  char v27 = 1;
  do
  {
    char v28 = v27;
    v36.origin.x = v13;
    v36.origin.y = v15;
    v36.size.width = v17;
    v36.size.height = v19;
    double v15 = v32 + CGRectGetMaxY(v36);
    double v17 = v17 + v11 * -2.0;
    double v23 = v11 + v23;
    v37.origin.x = v11 + v13;
    v37.origin.y = v15;
    v37.size.width = v17;
    v37.size.height = v11 - v32;
    CGContextClipToRect(a2, v37);
    v38.size.width = v25;
    v38.origin.x = v21;
    v38.origin.y = v23;
    v38.size.height = rect;
    CGContextDrawImage(a2, v38, *(CGImageRef *)(a1 + 48));
    CGContextResetClip(a2);
    char v27 = 0;
    double v19 = v11 - v32;
    double v13 = v11 + v13;
  }
  while ((v28 & 1) != 0);
}

double PXGAbsoluteTime()
{
  if (!dword_26A86D88C) {
    mach_timebase_info((mach_timebase_info_t)&PXGAbsoluteTime_sTimebase);
  }
  return (double)(mach_absolute_time() * PXGAbsoluteTime_sTimebase / dword_26A86D88C)
       / 1000000000.0;
}

double PXGClearColorFromColor(void *a1, CGColorSpace *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (!v3)
  {
    double v15 = [MEMORY[0x263F08690] currentHandler];
    double v16 = objc_msgSend(NSString, "stringWithUTF8String:", "MTLClearColor PXGClearColorFromColor(UIColor *__strong _Nonnull, CGColorSpaceRef _Nonnull)");
    [v15 handleFailureInFunction:v16, @"PXGTextureUtilities.m", 2111, @"Invalid parameter not satisfying: %@", @"color != nil" file lineNumber description];
  }
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  if (([v3 getRed:&v20 green:&v19 blue:&v18 alpha:&v17] & 1) == 0)
  {
    id v4 = PXAssertGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v3;
      _os_log_fault_impl(&dword_26039F000, v4, OS_LOG_TYPE_FAULT, "Unable to retrieve color components from backgroundColor:%@", buf, 0xCu);
    }

    uint64_t v17 = 0x3FF0000000000000;
    uint64_t v18 = 0x3FF0000000000000;
    uint64_t v19 = 0x3FF0000000000000;
    uint64_t v20 = 0x3FF0000000000000;
  }
  id v5 = v3;
  CGColorGetColorSpace((CGColorRef)[v5 CGColor]);
  if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(a2, kCGRenderingIntentDefault, (CGColorRef)[v5 CGColor], 0);
    Components = CGColorGetComponents(CopyByMatchingToColorSpace);
    size_t NumberOfComponents = CGColorGetNumberOfComponents(CopyByMatchingToColorSpace);
    if (NumberOfComponents != 3)
    {
      if (NumberOfComponents == 2)
      {
        uint64_t v10 = *((void *)Components + 1);
        uint64_t v18 = *(void *)Components;
        uint64_t v19 = v18;
        uint64_t v20 = v18;
      }
      else
      {
        if (NumberOfComponents == 1)
        {
          uint64_t v18 = *(void *)Components;
          uint64_t v19 = v18;
          uint64_t v20 = v18;
LABEL_13:
          uint64_t v17 = 0x3FF0000000000000;
LABEL_18:
          CGColorRelease(CopyByMatchingToColorSpace);
          goto LABEL_19;
        }
        if (NumberOfComponents < 4) {
          goto LABEL_18;
        }
        uint64_t v11 = *(void *)Components;
        uint64_t v19 = *((void *)Components + 1);
        uint64_t v20 = v11;
        uint64_t v10 = *((void *)Components + 3);
        uint64_t v18 = *((void *)Components + 2);
      }
      uint64_t v17 = v10;
      goto LABEL_18;
    }
    uint64_t v9 = *(void *)Components;
    uint64_t v19 = *((void *)Components + 1);
    uint64_t v20 = v9;
    uint64_t v18 = *((void *)Components + 2);
    goto LABEL_13;
  }
LABEL_19:
  double v12 = *(double *)&v20;
  double v13 = *(double *)&v17;

  return v12 * v13;
}

void sub_2603B295C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t PXGEntityDescription(unsigned int a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"{id=%ld}", a1);
}

uint64_t PXGSpriteIndexesEnumerateRanges(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2)
  {
    unint64_t v4 = a2;
    uint64_t v5 = result;
    uint64_t v6 = 0;
    do
    {
      unsigned __int16 v7 = (unsigned int *)(v5 + 4 * v6);
      uint64_t v8 = *v7;
      uint64_t v9 = 1;
      if (v4 >= 2)
      {
        while (v8 + v9 == v7[v9])
        {
          if (v4 == ++v9)
          {
            uint64_t v9 = v4;
            break;
          }
        }
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, v8 | (v9 << 32), v6);
      v6 += v9;
      v4 -= v9;
    }
    while (v4);
  }
  return result;
}

void PXGSpriteIndexesEnumerateRangesForPositions(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __PXGSpriteIndexesEnumerateRangesForPositions_block_invoke;
  v7[3] = &unk_265556500;
  id v8 = v5;
  uint64_t v9 = a1;
  id v6 = v5;
  [a2 enumerateRangesUsingBlock:v7];
}

void __PXGSpriteIndexesEnumerateRangesForPositions_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40) + 4 * a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __PXGSpriteIndexesEnumerateRangesForPositions_block_invoke_2;
  v6[3] = &unk_2655564D8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = a2;
  unint64_t v9 = a3;
  PXGSpriteIndexesEnumerateRanges(v5, a3, (uint64_t)v6);
}

uint64_t __PXGSpriteIndexesEnumerateRangesForPositions_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40) + a3);
}

void sub_2603B3B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2603B4324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2603B4DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1071(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1072(uint64_t a1)
{
}

BOOL PXGSpriteGeometryIsNull(uint64_t a1)
{
  BOOL result = 0;
  uint64_t v3 = *(void *)(a1 + 24);
  if (*(float *)&v3 == 0.0 && *((float *)&v3 + 1) == 0.0)
  {
    BOOL result = 0;
    if (*(double *)a1 == 0.0 && *(double *)(a1 + 8) == 0.0) {
      return *(double *)(a1 + 16) == 0.0;
    }
  }
  return result;
}

BOOL PXGCornerRadiusIsNull(float a1, float a2, float a3, float a4)
{
  return a1 == -1.0 && a2 == -1.0 && a3 == -1.0 && a4 == -1.0;
}

uint64_t PXGCornerRadiusDescription(float a1, float a2, float a3, float a4)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"{⌜:%.1f ⌝:%.1f ⌞:%.1f ⌟:%.1f}", a1, a2, a3, a4);
}

uint64_t PXGCornerRadiusForSubrectFromContainerCornerRadiusAndRect()
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    PXRectEdgeValue();
    PXRectEdgeValue();
    uint64_t result = PXFloatApproximatelyEqualToFloat();
    *(&v2 + i) = result;
  }
  return result;
}

float PXGCornerRadiusByLinearlyInterpolatingCornerRadii()
{
  uint64_t v0 = 0;
  v3[0] = 0;
  v3[1] = 0;
  do
  {
    PXFloatByLinearlyInterpolatingFloats();
    *(float *)&double v1 = v1;
    *(_DWORD *)((char *)v3 + v0) = LODWORD(v1);
    v0 += 4;
  }
  while (v0 != 16);
  return *(float *)v3;
}

id PXGSpriteGeometryTransformDescription(uint64_t a1)
{
  char v2 = NSString;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&transform.a = *(_OWORD *)a1;
  *(_OWORD *)&transform.c = v3;
  *(_OWORD *)&transform.tx = *(_OWORD *)(a1 + 32);
  unint64_t v4 = NSStringFromCGAffineTransform(&transform);
  uint64_t v5 = [v2 stringWithFormat:@"{affineTransform:%@, tz:%.3f}", v4, *(void *)(a1 + 48)];

  return v5;
}

void PXGAssertErrValidSprites(unsigned int *a1)
{
  PXGAssertErrValidGeometries(*a1, *((uint64_t **)a1 + 2));
  PXGAssertErrValidInfos(*a1, *((unsigned __int8 **)a1 + 4));
  uint64_t v2 = *a1;
  uint64_t v3 = *((void *)a1 + 3);

  PXGAssertErrValidStyles(v2, v3);
}

void PXGAssertErrValidGeometries(uint64_t a1, uint64_t *a2)
{
  if (a1 >= 1)
  {
    uint64_t v3 = a1;
    unint64_t v4 = 0x263F08000uLL;
    unint64_t v5 = 0x263F08000uLL;
    do
    {
      uint64_t v6 = *a2;
      if ((*a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
      {
        uint64_t v10 = [*(id *)(v4 + 1680) currentHandler];
        uint64_t v11 = objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
        [v10 handleFailureInFunction:v11, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"center.x", v6 file lineNumber description];
      }
      uint64_t v7 = a2[1];
      if ((v7 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
      {
        uint64_t v12 = [*(id *)(v4 + 1680) currentHandler];
        uint64_t v13 = objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
        [v12 handleFailureInFunction:v13, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"center.y", v7 file lineNumber description];

        unint64_t v4 = 0x263F08000;
      }
      uint64_t v8 = a2[2];
      if ((v8 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
      {
        uint64_t v14 = [*(id *)(v4 + 1680) currentHandler];
        uint64_t v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
        [v14 handleFailureInFunction:v15, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"center.z", v8 file lineNumber description];

        unint64_t v5 = 0x263F08000;
      }
      if ((a2[3] & 0x7FFFFFFFu) >= 0x7F800000)
      {
        float v20 = COERCE_FLOAT(a2[3]);
        uint64_t v16 = [*(id *)(v4 + 1680) currentHandler];
        uint64_t v17 = objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        [v16 handleFailureInFunction:v17, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", @"size.x", v20 file lineNumber description];

        float v9 = *((float *)a2 + 7);
      }
      else
      {
        LODWORD(v9) = HIDWORD(a2[3]);
      }
      if ((LODWORD(v9) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        uint64_t v18 = [*(id *)(v4 + 1680) currentHandler];
        uint64_t v19 = objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        [v18 handleFailureInFunction:v19, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", @"size.y", v9 file lineNumber description];
      }
      a2 += 4;
      --v3;
    }
    while (v3);
  }
}

void PXGAssertErrValidInfos(uint64_t a1, unsigned __int8 *a2)
{
  if (a1 >= 1)
  {
    uint64_t v3 = a1;
    do
    {
      if (*a2 >= 3u)
      {
        uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
        uint64_t v10 = objc_msgSend(NSString, "stringWithUTF8String:", "void PXGAssertErrValidInfos(NSInteger, PXGSpriteInfo * _Nonnull)");
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v10, @"PXGTypes.m", 166, @"Invalid value: presentationType=%d", *a2);
      }
      if ((*((_DWORD *)a2 + 2) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        float v7 = COERCE_FLOAT(*((void *)a2 + 1));
        uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
        uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        [v11 handleFailureInFunction:v6, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", @"mediaTargetSize.x", v7 file lineNumber description];

        float v4 = *((float *)a2 + 3);
      }
      else
      {
        LODWORD(v4) = HIDWORD(*((void *)a2 + 1));
      }
      if ((LODWORD(v4) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
        uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        [v12 handleFailureInFunction:v8, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", @"mediaTargetSize.y", v4 file lineNumber description];
      }
      float v5 = *((float *)a2 + 4);
      if ((LODWORD(v5) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
        float v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        [v13 handleFailureInFunction:v9, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", @"mediaAspectRatio", v5 file lineNumber description];
      }
      a2 += 40;
      --v3;
    }
    while (v3);
  }
}

void PXGAssertErrValidStyles(uint64_t a1, uint64_t a2)
{
  if (a1 >= 1)
  {
    uint64_t v2 = a1;
    uint64_t v3 = (float *)(a2 + 8);
    unint64_t v4 = 0x263F08000uLL;
    unint64_t v5 = 0x263F08000uLL;
    uint64_t v6 = @"alpha";
    float v7 = @"contentsRect.x";
    uint64_t v8 = @"contentsRect.y";
    float v9 = @"contentsRect.z";
    uint64_t v10 = @"contentsRect.w";
    uint64_t v11 = @"cornerRadius.topLeft";
    uint64_t v12 = @"cornerRadius.topRight";
    uint64_t v13 = @"cornerRadius.bottomLeft";
    uint64_t v14 = @"cornerRadius.bottomRight";
    do
    {
      float v15 = *(v3 - 2);
      if ((LODWORD(v15) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        CGFloat v25 = *(void **)(v4 + 1680);
        double v26 = v6;
        char v27 = v14;
        char v28 = [v25 currentHandler];
        objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v30 = unint64_t v29 = v5;
        [v28 handleFailureInFunction:v30, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", v26, v15 file lineNumber description];

        unint64_t v5 = v29;
        uint64_t v14 = v27;
        uint64_t v13 = @"cornerRadius.bottomLeft";
        uint64_t v12 = @"cornerRadius.topRight";
        uint64_t v11 = @"cornerRadius.topLeft";
        uint64_t v10 = @"contentsRect.w";
        float v9 = @"contentsRect.z";
        uint64_t v8 = @"contentsRect.y";
        float v7 = @"contentsRect.x";
        uint64_t v6 = v26;
        unint64_t v4 = 0x263F08000;
      }
      float v16 = v3[11];
      if ((LODWORD(v16) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        long long v31 = [*(id *)(v4 + 1680) currentHandler];
        objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v33 = unint64_t v32 = v5;
        [v31 handleFailureInFunction:v33, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", @"zSortOffset", v16 file lineNumber description];

        unint64_t v5 = v32;
        uint64_t v14 = @"cornerRadius.bottomRight";
        uint64_t v13 = @"cornerRadius.bottomLeft";
        uint64_t v12 = @"cornerRadius.topRight";
        uint64_t v11 = @"cornerRadius.topLeft";
        uint64_t v10 = @"contentsRect.w";
        float v9 = @"contentsRect.z";
        uint64_t v8 = @"contentsRect.y";
        float v7 = @"contentsRect.x";
        uint64_t v6 = @"alpha";
      }
      long long v17 = *(_OWORD *)(v3 - 1);
      if ((v17 & 0x7FFFFFFF) >= 0x7F800000)
      {
        CGRect v34 = v7;
        long long v66 = *(_OWORD *)(v3 - 1);
        CGRect v35 = [*(id *)(v4 + 1680) currentHandler];
        objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v37 = unint64_t v36 = v5;
        [v35 handleFailureInFunction:v37, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", v34, *(float *)&v66 file lineNumber description];

        unint64_t v5 = v36;
        uint64_t v14 = @"cornerRadius.bottomRight";
        uint64_t v13 = @"cornerRadius.bottomLeft";
        uint64_t v12 = @"cornerRadius.topRight";
        uint64_t v11 = @"cornerRadius.topLeft";
        uint64_t v10 = @"contentsRect.w";
        float v9 = @"contentsRect.z";
        uint64_t v8 = @"contentsRect.y";
        float v7 = v34;
        uint64_t v6 = @"alpha";
        float v18 = *v3;
      }
      else
      {
        float v18 = *((float *)&v17 + 1);
      }
      if ((LODWORD(v18) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        CGRect v38 = v8;
        int v39 = [*(id *)(v4 + 1680) currentHandler];
        objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v41 = unint64_t v40 = v5;
        [v39 handleFailureInFunction:v41, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", v38, v18 file lineNumber description];

        unint64_t v5 = v40;
        uint64_t v14 = @"cornerRadius.bottomRight";
        uint64_t v13 = @"cornerRadius.bottomLeft";
        uint64_t v12 = @"cornerRadius.topRight";
        uint64_t v11 = @"cornerRadius.topLeft";
        uint64_t v10 = @"contentsRect.w";
        float v9 = @"contentsRect.z";
        uint64_t v8 = v38;
        float v7 = @"contentsRect.x";
        uint64_t v6 = @"alpha";
      }
      float v19 = v3[1];
      if ((LODWORD(v19) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        __int16 v42 = v9;
        int v43 = [*(id *)(v4 + 1680) currentHandler];
        objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        int v45 = v44 = v5;
        [v43 handleFailureInFunction:v45, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", v42, v19 file lineNumber description];

        unint64_t v5 = v44;
        uint64_t v14 = @"cornerRadius.bottomRight";
        uint64_t v13 = @"cornerRadius.bottomLeft";
        uint64_t v12 = @"cornerRadius.topRight";
        uint64_t v11 = @"cornerRadius.topLeft";
        uint64_t v10 = @"contentsRect.w";
        float v9 = v42;
        uint64_t v8 = @"contentsRect.y";
        float v7 = @"contentsRect.x";
        uint64_t v6 = @"alpha";
      }
      float v20 = v3[2];
      if ((LODWORD(v20) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        uint64_t v46 = v10;
        float64x2_t v47 = [*(id *)(v4 + 1680) currentHandler];
        objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v49 = unint64_t v48 = v5;
        [v47 handleFailureInFunction:v49, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", v46, v20 file lineNumber description];

        unint64_t v5 = v48;
        uint64_t v14 = @"cornerRadius.bottomRight";
        uint64_t v13 = @"cornerRadius.bottomLeft";
        uint64_t v12 = @"cornerRadius.topRight";
        uint64_t v11 = @"cornerRadius.topLeft";
        uint64_t v10 = v46;
        float v9 = @"contentsRect.z";
        uint64_t v8 = @"contentsRect.y";
        float v7 = @"contentsRect.x";
        uint64_t v6 = @"alpha";
      }
      float v21 = v3[7];
      if ((LODWORD(v21) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        double v50 = v11;
        long long v51 = [*(id *)(v4 + 1680) currentHandler];
        objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v53 = unint64_t v52 = v5;
        [v51 handleFailureInFunction:v53, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", v50, v21 file lineNumber description];

        unint64_t v5 = v52;
        uint64_t v14 = @"cornerRadius.bottomRight";
        uint64_t v13 = @"cornerRadius.bottomLeft";
        uint64_t v12 = @"cornerRadius.topRight";
        uint64_t v11 = v50;
        uint64_t v10 = @"contentsRect.w";
        float v9 = @"contentsRect.z";
        uint64_t v8 = @"contentsRect.y";
        float v7 = @"contentsRect.x";
        uint64_t v6 = @"alpha";
      }
      float v22 = v3[8];
      if ((LODWORD(v22) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        uint64_t v54 = v12;
        CGSize v55 = [*(id *)(v4 + 1680) currentHandler];
        objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v57 = unint64_t v56 = v5;
        [v55 handleFailureInFunction:v57, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", v54, v22 file lineNumber description];

        unint64_t v5 = v56;
        uint64_t v14 = @"cornerRadius.bottomRight";
        uint64_t v13 = @"cornerRadius.bottomLeft";
        uint64_t v12 = v54;
        uint64_t v11 = @"cornerRadius.topLeft";
        uint64_t v10 = @"contentsRect.w";
        float v9 = @"contentsRect.z";
        uint64_t v8 = @"contentsRect.y";
        float v7 = @"contentsRect.x";
        uint64_t v6 = @"alpha";
      }
      float v23 = v3[9];
      if ((LODWORD(v23) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        uint64_t v58 = v13;
        v59 = [*(id *)(v4 + 1680) currentHandler];
        objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v61 = unint64_t v60 = v5;
        [v59 handleFailureInFunction:v61, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", v58, v23 file lineNumber description];

        unint64_t v5 = v60;
        uint64_t v14 = @"cornerRadius.bottomRight";
        uint64_t v13 = v58;
        uint64_t v12 = @"cornerRadius.topRight";
        uint64_t v11 = @"cornerRadius.topLeft";
        uint64_t v10 = @"contentsRect.w";
        float v9 = @"contentsRect.z";
        uint64_t v8 = @"contentsRect.y";
        float v7 = @"contentsRect.x";
        uint64_t v6 = @"alpha";
      }
      float v24 = v3[10];
      if ((LODWORD(v24) & 0x7FFFFFFFu) >= 0x7F800000)
      {
        CGAffineTransform v62 = v14;
        v63 = [*(id *)(v4 + 1680) currentHandler];
        objc_msgSend(*(id *)(v5 + 2880), "stringWithUTF8String:", "void _assertValidFloat(float, NSString *__strong)");
        v65 = unint64_t v64 = v5;
        [v63 handleFailureInFunction:v65, @"PXGTypes.m", 115, @"Invalid value: %@ = %.3f", v62, v24 file lineNumber description];

        unint64_t v5 = v64;
        uint64_t v14 = v62;
        uint64_t v13 = @"cornerRadius.bottomLeft";
        uint64_t v12 = @"cornerRadius.topRight";
        uint64_t v11 = @"cornerRadius.topLeft";
        uint64_t v10 = @"contentsRect.w";
        float v9 = @"contentsRect.z";
        uint64_t v8 = @"contentsRect.y";
        float v7 = @"contentsRect.x";
        uint64_t v6 = @"alpha";
      }
      v3 += 40;
      --v2;
    }
    while (v2);
  }
}

void PXGAssertErrValidFloat(double a1)
{
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    id v3 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v2 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v3 handleFailureInFunction:v2, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"float", *(void *)&a1 file lineNumber description];
  }
}

void PXGAssertErrValidPoint(double a1, double a2)
{
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    unint64_t v4 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v4 handleFailureInFunction:v5, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"x", *(void *)&a1 file lineNumber description];
  }
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v7 handleFailureInFunction:v6, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"y", *(void *)&a2 file lineNumber description];
  }
}

void PXGAssertErrValidRect(double a1, double a2, double a3, double a4)
{
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    float v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v8 handleFailureInFunction:v9, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"origin.x", *(void *)&a1 file lineNumber description];
  }
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v10 handleFailureInFunction:v11, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"origin.y", *(void *)&a2 file lineNumber description];
  }
  if ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v12 handleFailureInFunction:v13, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"size.width", *(void *)&a3 file lineNumber description];
  }
  if ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    id v15 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v14 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v15 handleFailureInFunction:v14, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"size.height", *(void *)&a4 file lineNumber description];
  }
}

void PXGAssertErrValidSize(double a1, double a2)
{
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    unint64_t v4 = [MEMORY[0x263F08690] currentHandler];
    unint64_t v5 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v4 handleFailureInFunction:v5, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"width", *(void *)&a1 file lineNumber description];
  }
  if ((*(void *)&a2 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v7 handleFailureInFunction:v6, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"height", *(void *)&a2 file lineNumber description];
  }
}

void PXGAssertErrValidAffineTransform(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((*a1 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    float v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v8 handleFailureInFunction:v9, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"a", v2 file lineNumber description];
  }
  uint64_t v3 = a1[1];
  if ((v3 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v10 handleFailureInFunction:v11, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"b", v3 file lineNumber description];
  }
  uint64_t v4 = a1[2];
  if ((v4 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v12 handleFailureInFunction:v13, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"c", v4 file lineNumber description];
  }
  uint64_t v5 = a1[3];
  if ((v5 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    id v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v14 handleFailureInFunction:v15, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"d", v5 file lineNumber description];
  }
  uint64_t v6 = a1[4];
  if ((v6 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    float v16 = [MEMORY[0x263F08690] currentHandler];
    long long v17 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v16 handleFailureInFunction:v17, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"tx", v6 file lineNumber description];
  }
  uint64_t v7 = a1[5];
  if ((v7 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000)
  {
    id v19 = [MEMORY[0x263F08690] currentHandler];
    float v18 = objc_msgSend(NSString, "stringWithUTF8String:", "void _assertValidCGFloat(CGFloat, NSString *__strong)");
    [v19 handleFailureInFunction:v18, @"PXGTypes.m", 119, @"Invalid value: %@ = %.3f", @"ty", v7 file lineNumber description];
  }
}

uint64_t PXGSpriteTextureInfoOrientationToCGOrientation(__n128 a1)
{
  if (a1.n128_f32[2] >= 0.0) {
    int v1 = 5;
  }
  else {
    int v1 = 8;
  }
  if (a1.n128_f32[1] > 0.0) {
    unsigned int v2 = v1;
  }
  else {
    unsigned int v2 = 1;
  }
  if (a1.n128_f32[2] >= 0.0) {
    int v3 = 6;
  }
  else {
    int v3 = 7;
  }
  if (a1.n128_f32[1] < 0.0) {
    unsigned int v2 = v3;
  }
  if (a1.n128_f32[3] >= 0.0) {
    int v4 = 1;
  }
  else {
    int v4 = 4;
  }
  if (a1.n128_f32[0] > 0.0) {
    unsigned int v2 = v4;
  }
  if (a1.n128_f32[3] >= 0.0) {
    unsigned int v5 = 2;
  }
  else {
    unsigned int v5 = 3;
  }
  if (a1.n128_f32[0] < 0.0) {
    return v5;
  }
  else {
    return v2;
  }
}

uint64_t PXGImageDataSpecDescription(uint64_t a1)
{
  return [NSString stringWithFormat:@"{pixelFormat:%lu, width:%d, height:%d}", *(void *)a1, *(unsigned __int16 *)(a1 + 16), *(unsigned __int16 *)(a1 + 18)];
}

unint64_t PXGSpriteIndexRangeUnion(NSRange a1)
{
  NSUInteger location_high = HIDWORD(a1.location);
  a1.location = LODWORD(a1.location);
  v4.length = HIDWORD(a1.length);
  v4.location = LODWORD(a1.length);
  a1.length = location_high;
  NSRange v2 = NSUnionRange(a1, v4);
  return LODWORD(v2.location) | ((unint64_t)LODWORD(v2.length) << 32);
}

uint64_t NSStringFromPXGSpriteIndexRange(unint64_t a1)
{
  return [NSString stringWithFormat:@"{%li, %li}", a1, HIDWORD(a1)];
}

uint64_t PXGVectorFloat2Description(double a1)
{
  return [NSString stringWithFormat:@"{%.2f, %.2f}", *(float *)&a1, *((float *)&a1 + 1)];
}

uint64_t PXGVectorFloat3Description(__n128 a1)
{
  return [NSString stringWithFormat:@"{%.2f, %.2f, %.2f}", a1.n128_f32[0], a1.n128_f32[1], a1.n128_f32[2]];
}

uint64_t PXGVectorFloat4Description(__n128 a1)
{
  return [NSString stringWithFormat:@"{%.2f, %.2f, %.2f, %.2f}", a1.n128_f32[0], a1.n128_f32[1], a1.n128_f32[2], a1.n128_f32[3]];
}

uint64_t PXGPositionDescription(double a1, double a2, double a3)
{
  return [NSString stringWithFormat:@"{%.2f, %.2f, %.5f}", *(void *)&a1, *(void *)&a2, *(void *)&a3];
}

id PXGSpriteGeometryDescription(void *a1)
{
  NSRange v2 = NSString;
  int v3 = [NSString stringWithFormat:@"{%.2f, %.2f, %.5f}", *a1, a1[1], a1[2]];
  NSRange v4 = [NSString stringWithFormat:@"{%.2f, %.2f}", COERCE_FLOAT(a1[3]), COERCE_FLOAT(HIDWORD(a1[3]))];
  unsigned int v5 = [v2 stringWithFormat:@"{center=%@, size=%@}", v3, v4];

  return v5;
}

float PXSpriteGeometryScaleWithTransform(uint64_t a1, float32x4_t a2, float32x4_t a3, float32x4_t a4, float32x4_t a5, float64x2_t a6, float64_t a7, __n128 a8)
{
  float32x2_t v8 = *(float32x2_t *)(a1 + 24);
  float v9 = *(double *)(a1 + 16);
  float v10 = v9 - a8.n128_f32[2];
  float v11 = vmuls_lane_f32(0.5, v8, 1);
  float v12 = *(double *)a1;
  float v13 = (float)(v12 - (float)(0.5 * v8.f32[0])) - a8.n128_f32[0];
  float v14 = *(double *)(a1 + 8);
  float v15 = (float)(v11 + v14) - a8.n128_f32[1];
  float v16 = (float)(v14 - v11) - a8.n128_f32[1];
  float v17 = (float)((float)(0.5 * v8.f32[0]) + v12) - a8.n128_f32[0];
  float32x4_t v18 = vmulq_n_f32(a2, v13);
  int32x4_t v19 = (int32x4_t)vaddq_f32(a5, vmlaq_n_f32(vmlaq_n_f32(v18, a3, v15), a4, v10));
  int32x4_t v20 = (int32x4_t)vaddq_f32(a5, vmlaq_n_f32(vmlaq_n_f32(v18, a3, v16), a4, v10));
  float32x4_t v21 = vmulq_n_f32(a2, v17);
  int32x4_t v22 = (int32x4_t)vaddq_f32(a5, vmlaq_n_f32(vmlaq_n_f32(v21, a3, v16), a4, v10));
  int32x4_t v23 = (int32x4_t)vaddq_f32(a5, vmlaq_n_f32(vmlaq_n_f32(v21, a3, v15), a4, v10));
  v21.i64[0] = vuzp2q_s32(vuzp2q_s32(v20, v19), v20).u64[0];
  v21.i64[1] = __PAIR64__(v23.u32[3], v22.u32[3]);
  char v24 = vmaxv_u16((uint16x4_t)vmovn_s32(vclezq_f32(v21)));
  float result = 0.0;
  if ((v24 & 1) == 0)
  {
    float32x2_t v26 = vdiv_f32(*(float32x2_t *)v20.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v20, 3));
    float32x2_t v27 = vdiv_f32(*(float32x2_t *)v23.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v23, 3));
    int8x8_t v28 = (int8x8_t)vcgt_f32(v27, v26);
    float32x2_t v29 = (float32x2_t)vbsl_s8(v28, (int8x8_t)v26, (int8x8_t)v27);
    float32x2_t v30 = vdiv_f32(*(float32x2_t *)v22.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 3));
    float32x2_t v31 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v29, v30), (int8x8_t)v30, (int8x8_t)v29);
    float32x2_t v32 = vdiv_f32(*(float32x2_t *)v19.i8, (float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v19, 3));
    float32x2_t v33 = (float32x2_t)vbsl_s8(v28, (int8x8_t)v27, (int8x8_t)v26);
    float32x2_t v34 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v33, v30), (int8x8_t)v33, (int8x8_t)v30);
    a6.f64[1] = a7;
    float64x2_t v35 = vmulq_f64(a6, vabdq_f64(vcvtq_f64_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v34, v32), (int8x8_t)v34, (int8x8_t)v32)), vcvtq_f64_f32((float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(v31, v32), (int8x8_t)v32, (int8x8_t)v31))));
    __asm { FMOV            V1.2D, #0.5 }
    float64x2_t v41 = vdivq_f64(vmulq_f64(v35, _Q1), vcvtq_f64_f32(v8));
    if (v41.f64[0] < v41.f64[1]) {
      v41.f64[0] = v41.f64[1];
    }
    return v41.f64[0];
  }
  return result;
}

id PXGSpriteStyleDescription(uint64_t a1)
{
  NSRange v2 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"{"];
  int v3 = v2;
  if (*(float *)a1 != 1.0) {
    [v2 appendFormat:@"alpha=%.2f, ", *(float *)a1];
  }
  float32x4_t v4 = *(float32x4_t *)(a1 + 4);
  if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v4, (float32x4_t)xmmword_2603C3610)))))
  {
    unsigned int v5 = [NSString stringWithFormat:@"{%.2f, %.2f, %.2f, %.2f}", v4.f32[0], v4.f32[1], v4.f32[2], v4.f32[3]];
    [v3 appendFormat:@"contentsRect=%@, ", v5];
  }
  long long v6 = *(_OWORD *)(a1 + 20);
  float v7 = COERCE_FLOAT(*(void *)(a1 + 28));
  if (v7 != 1000000000.0 || *((float *)&v6 + 3) != 1000000000.0)
  {
    float32x2_t v8 = [NSString stringWithFormat:@"{%.2f, %.2f, %.2f, %.2f}", *(float *)&v6, *((float *)&v6 + 1), v7, *((float *)&v6 + 3)];
    [v3 appendFormat:@"clippingRect=%@, ", v8];
  }
  float v9 = *(float *)(a1 + 36);
  float v10 = *(float *)(a1 + 40);
  float v11 = *(float *)(a1 + 44);
  float v12 = *(float *)(a1 + 48);
  if (v9 != 0.0 || v10 != 0.0 || v11 != 0.0 || v12 != 0.0)
  {
    float v13 = objc_msgSend(NSString, "stringWithFormat:", @"{⌜:%.1f ⌝:%.1f ⌞:%.1f ⌟:%.1f}", v9, v10, v11, v12);
    [v3 appendFormat:@"cornerRadius=%@, ", v13];
  }
  float v14 = *(float *)(a1 + 52);
  if (v14 != 0.0) {
    [v3 appendFormat:@"zSortOffset=%.5f, ", v14];
  }
  if (*(_WORD *)(a1 + 68)) {
    [v3 appendFormat:@"resizableCapInsetsIndex=%u, ", *(unsigned __int16 *)(a1 + 68)];
  }
  uint64_t v15 = *(unsigned __int8 *)(a1 + 70);
  if (*(unsigned char *)(a1 + 70))
  {
    if (v15 > 0xD) {
      float v16 = @"unexpected";
    }
    else {
      float v16 = off_265556820[v15];
    }
    float v17 = v16;
    [v3 appendFormat:@"contentsGravity=%@, ", v17];
  }
  objc_msgSend(v3, "px_removeSuffix:", @", ");
  [v3 appendString:@"}"];

  return v3;
}

__CFString *PXGContentsGravityDescription(unsigned int a1)
{
  if (a1 > 0xD) {
    return @"unexpected";
  }
  else {
    return off_265556820[a1];
  }
}

__CFString *PXGPresentationTypeDescription(unsigned int a1)
{
  if (a1 > 2) {
    return @"unexpected";
  }
  else {
    return off_265556890[a1];
  }
}

__CFString *PXGMediaKindDescription(unsigned int a1)
{
  if (a1 > 0xD) {
    return @"unexpected";
  }
  else {
    return off_2655568A8[a1];
  }
}

id PXGSpriteInfoFlagsDescription(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  float v9 = __PXGSpriteInfoFlagsDescription_block_invoke;
  float v10 = &unk_2655567B8;
  char v12 = a1;
  id v3 = v2;
  id v11 = v3;
  float32x4_t v4 = (void (**)(void, void, void))MEMORY[0x26120F950](&v7);
  ((void (**)(void, uint64_t, __CFString *))v4)[2](v4, 1, @"alwaysLoad");
  ((void (**)(void, uint64_t, __CFString *))v4)[2](v4, 2, @"excludeFromHitTesting");
  ((void (**)(void, uint64_t, __CFString *))v4)[2](v4, 4, @"focusItemProxy");
  ((void (**)(void, uint64_t, __CFString *))v4)[2](v4, 16, @"excludeFromRemoteEffects");
  objc_msgSend(v3, "insertString:atIndex:", @"[", 0, v7, v8, v9, v10);
  [v3 appendString:@"]"];
  id v5 = v3;

  return v5;
}

void __PXGSpriteInfoFlagsDescription_block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if ((a2 & ~*(unsigned __int8 *)(a1 + 40)) == 0)
  {
    id v8 = v5;
    uint64_t v6 = [*(id *)(a1 + 32) length];
    uint64_t v7 = *(void **)(a1 + 32);
    if (v6) {
      [v7 appendFormat:@"|%@", v8];
    }
    else {
      [v7 setString:v8];
    }
    id v5 = v8;
  }
}

id PXGSpriteTextureInfoDescription(void *a1)
{
  id v2 = NSString;
  id v3 = [NSString stringWithFormat:@"{%.2f, %.2f}", COERCE_FLOAT(*a1), COERCE_FLOAT(HIDWORD(*a1))];
  float32x4_t v4 = [NSString stringWithFormat:@"{%.2f, %.2f}", COERCE_FLOAT(a1[1]), COERCE_FLOAT(HIDWORD(a1[1]))];
  id v5 = [NSString stringWithFormat:@"{%.2f, %.2f}", COERCE_FLOAT(a1[2]), COERCE_FLOAT(HIDWORD(a1[2]))];
  uint64_t v6 = [v2 stringWithFormat:@"{contentsOrigin:%@, contentsSize:%@, textureSize:%@}", v3, v4, v5];

  return v6;
}

__CFString *PXGColorOpcodeDescription(unsigned int a1)
{
  if (a1 > 0x10) {
    return @"Unknown";
  }
  else {
    return off_265556918[a1];
  }
}

void PXGSpriteApplyTransform(double *a1, uint64_t a2, uint64_t a3, double *a4)
{
  long long v7 = *((_OWORD *)a4 + 1);
  *(_OWORD *)&t1.a = *(_OWORD *)a4;
  *(_OWORD *)&t1.c = v7;
  *(_OWORD *)&t1.tx = *((_OWORD *)a4 + 2);
  double v8 = a4[6];
  CGAffineTransform v22 = *(CGAffineTransform *)PXGSpriteGeometryTransformIdentity;
  if (!CGAffineTransformEqualToTransform(&t1, &v22) || v8 != 0.0)
  {
    double v9 = *a4;
    double v10 = a4[1];
    double v11 = a4[2];
    double v12 = a4[3];
    double v13 = a4[4];
    double v14 = a4[5];
    float v15 = v11 * *(float *)(a2 + 60) + *a4 * *(float *)(a2 + 60);
    *(float *)(a2 + 60) = v15;
    double v16 = a1[1];
    double v17 = v13 + v11 * v16 + v9 * *a1;
    *a1 = v17;
    a1[1] = v14 + v12 * v16 + v10 * v17;
    *(float *)&double v17 = v8;
    a1[2] = a1[2] + *(float *)&v17;
    float32x4_t v18 = *(float32x4_t *)(a2 + 20);
    if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v18, (float32x4_t)xmmword_2603C3620)))))
    {
      v24.origin.x = v18.f32[0];
      v24.origin.CGFloat y = v18.f32[1];
      v24.size.width = v18.f32[2];
      v24.size.CGFloat height = v18.f32[3];
      long long v19 = *((_OWORD *)a4 + 1);
      *(_OWORD *)&t1.a = *(_OWORD *)a4;
      *(_OWORD *)&t1.c = v19;
      *(_OWORD *)&t1.tx = *((_OWORD *)a4 + 2);
      CGRect v25 = CGRectApplyAffineTransform(v24, &t1);
      CGFloat height = v25.size.height;
      CGFloat y = v25.origin.y;
      *(float32x4_t *)(a2 + 20) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v25.origin), (float64x2_t)v25.size);
    }
  }
}

float32x4_t PXGSpriteStyleUnionClippingRect(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v6 = a2;
  float32x4_t v7 = *(float32x4_t *)(a1 + 20);
  *(int16x4_t *)result.f32 = vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v7, (float32x4_t)xmmword_2603C3620)));
  result.i16[0] = vmaxv_u16(*(uint16x4_t *)result.f32);
  if (result.i8[0])
  {
    v14.origin.x = v7.f32[0];
    v14.origin.CGFloat y = v7.f32[1];
    v14.size.width = v7.f32[2];
    v14.size.CGFloat height = v7.f32[3];
    CGRect v15 = CGRectUnion(v14, *(CGRect *)&v6);
    CGFloat height = v15.size.height;
    CGFloat y = v15.origin.y;
    float32x4_t result = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)v15.origin), (float64x2_t)v15.size);
    *(float32x4_t *)(a1 + 20) = result;
  }
  return result;
}

id PXGShaderFlagsDescription(int a1)
{
  if (PXGShaderFlagsDescription_onceToken != -1) {
    dispatch_once(&PXGShaderFlagsDescription_onceToken, &__block_literal_global_333);
  }
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = (void *)PXGShaderFlagsDescription_descriptionByBit;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __PXGShaderFlagsDescription_block_invoke_421;
  v9[3] = &unk_265556800;
  int v11 = a1;
  id v10 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v9];
  id v5 = NSString;
  double v6 = [v4 componentsJoinedByString:@", "];
  float32x4_t v7 = [v5 stringWithFormat:@"[%@]", v6];

  return v7;
}

void __PXGShaderFlagsDescription_block_invoke_421(uint64_t a1, void *a2, void *a3)
{
  id v11 = a3;
  int v5 = *(_DWORD *)(a1 + 40);
  unsigned int v6 = [a2 integerValue];
  uint64_t v7 = v5 & v6;
  if ((v5 & v6) != 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [*(id *)(a1 + 32) addObject:v11];
    }
    else
    {
      double v8 = (void (**)(void, void))MEMORY[0x26120F950](v11);
      double v9 = *(void **)(a1 + 32);
      id v10 = v8[2](v8, v7);
      [v9 addObject:v10];
    }
  }
}

void __PXGShaderFlagsDescription_block_invoke()
{
  v3[17] = *MEMORY[0x263EF8340];
  v2[0] = &unk_270C587E0;
  v2[1] = &unk_270C587F8;
  v3[0] = @"ARGBtoRGBA";
  v3[1] = @"ABGRtoBGRA";
  v2[2] = &unk_270C58810;
  v2[3] = &unk_270C58828;
  void v3[2] = @"RtoGray";
  v3[3] = @"RGtoGrayA";
  v2[4] = &unk_270C58840;
  v2[5] = &unk_270C58858;
  _WORD v3[4] = &__block_literal_global_358;
  v3[5] = &__block_literal_global_363;
  v2[6] = &unk_270C58870;
  v2[7] = &unk_270C58888;
  v3[6] = @"RoundedCorners";
  v3[7] = @"InvertColors";
  v2[8] = &unk_270C588A0;
  v2[9] = &unk_270C588B8;
  v3[8] = @"EffectShader";
  v3[9] = @"DebugXR";
  v2[10] = &unk_270C588D0;
  v2[11] = &unk_270C588E8;
  v3[10] = @"DebugIsOpaque";
  v3[11] = @"DebugIsNotOpaque";
  v2[12] = &unk_270C58900;
  v2[13] = &unk_270C58918;
  v3[12] = @"DebugResolution";
  v3[13] = @"DebugColorTransform";
  v2[14] = &unk_270C58930;
  v2[15] = &unk_270C58948;
  v3[14] = @"FragmentClipping";
  v3[15] = @"ViewportRoundedCorners";
  v2[16] = &unk_270C58960;
  v3[16] = @"DebugMipmaps";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:17];
  int v1 = (void *)PXGShaderFlagsDescription_descriptionByBit;
  PXGShaderFlagsDescription_descriptionByBit = v0;
}

__CFString *PXGYCbCrBitDepthDescription(unsigned int a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"PXGYCbCr_Bit_Depth_Unknown(%d)", a1);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_2655569F0[a1];
  }

  return v1;
}

__CFString *PXGYCbCrMatrixDescription(unsigned int a1)
{
  if (a1 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"PXGYCbCrMatrix_Unknown(%d)", a1);
    int v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v1 = off_2655569A0[a1];
  }

  return v1;
}

BOOL PXGShaderOpcodesIsOpaque(uint64_t a1, int a2)
{
  return a2 == 0;
}

unint64_t PXGShaderOpcodesAppending(unint64_t a1, unsigned int a2, unint64_t a3, unsigned int a4)
{
  unint64_t v6 = HIDWORD(a1);
  unint64_t v7 = HIDWORD(a3);
  unsigned int appended = _appendOpcodes(a1, a3);
  uint64_t v9 = _appendOpcodes(v6, v7);
  _appendOpcodes(a2, a4);
  return appended | (unint64_t)(v9 << 32);
}

uint64_t _appendOpcodes(unsigned int a1, unsigned int a2)
{
  uint64_t v4 = _opcodesCount(a1);
  uint64_t v5 = _opcodesCount(a2) + v4;
  if (v5 >= 8)
  {
    double v8 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "uint32_t _appendOpcodes(const uint32_t, const uint32_t)");
    [v8 handleFailureInFunction:v9, @"PXGTypes.m", 646, @"Invalid parameter not satisfying: %@", @"expectedOpcodesCount <= PXGOpcodeMax" file lineNumber description];
  }
  uint64_t v6 = (a2 << (4 * v4)) | a1;
  if (v5 != _opcodesCount(v6))
  {
    id v10 = [MEMORY[0x263F08690] currentHandler];
    id v11 = objc_msgSend(NSString, "stringWithUTF8String:", "uint32_t _appendOpcodes(const uint32_t, const uint32_t)");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, @"PXGTypes.m", 648, @"Unexpected opcodes count %ld != %ld", v5, _opcodesCount(v6));
  }
  return v6;
}

uint64_t _opcodesCount(unsigned int a1)
{
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  BOOL v4 = 0;
  do
  {
    if (((a1 >> v2) & 0xF) != 0)
    {
      if (v4)
      {
        unint64_t v7 = [MEMORY[0x263F08690] currentHandler];
        uint64_t v5 = [NSString stringWithUTF8String:"NSInteger _opcodesCount(uint32_t)"];
        [v7 handleFailureInFunction:v5 file:@"PXGTypes.m" lineNumber:630 description:@"Opcodes cannot have holes"];
      }
      ++v3;
    }
    else
    {
      BOOL v4 = v3 > 0;
    }
    v2 += 4;
  }
  while (v2 != 28);
  return v3;
}

id PXGShaderOpcodesDescription(unint64_t a1, unsigned int a2)
{
  unsigned int v3 = a1;
  unint64_t v4 = HIDWORD(a1);
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v8 = 0;
  while (2)
  {
    uint64_t v9 = 0;
    switch((v3 >> v8) & 0xF)
    {
      case 0u:
        goto LABEL_5;
      case 1u:
        uint64_t v9 = @"EdgeStretch";
        goto LABEL_5;
      case 2u:
        uint64_t v9 = @"Pinch";
LABEL_5:
        objc_msgSend(v5, "px_addObjectIfNotNil:", v9);
        id v10 = 0;
        switch((v4 >> v8) & 0xF)
        {
          case 0u:
            goto LABEL_11;
          case 1u:
            id v10 = @"ColorGrading";
            goto LABEL_11;
          case 2u:
            id v10 = @"ColorTint";
            goto LABEL_11;
          case 3u:
            id v10 = @"TextLegibilityNormal";
            goto LABEL_11;
          case 4u:
            id v10 = @"TextLegibilityDarkenSourceOver";
            goto LABEL_11;
          case 5u:
            id v10 = @"TextLegibilityColorMatrix";
LABEL_11:
            objc_msgSend(v6, "px_addObjectIfNotNil:", v10);
            id v11 = 0;
            switch((a2 >> v8) & 0xF)
            {
              case 0u:
                goto LABEL_14;
              case 1u:
                id v11 = @"RegionMask";
                goto LABEL_14;
              case 2u:
                id v11 = @"EdgeFade";
LABEL_14:
                objc_msgSend(v7, "px_addObjectIfNotNil:", v11);
                v8 += 4;
                if (v8 != 28) {
                  continue;
                }
                double v12 = NSString;
                double v13 = [v5 componentsJoinedByString:@", "];
                CGRect v14 = [v6 componentsJoinedByString:@", "];
                CGRect v15 = [v7 componentsJoinedByString:@", "];
                double v16 = [v12 stringWithFormat:@"{ .textureCoordinate = [%@], .color = [%@], .alpha = [%@] }", v13, v14, v15];

                return v16;
              case 3u:
                float32x4_t v18 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", 0);
                long long v19 = [NSString stringWithUTF8String:"NSString *PXGFragmentAlphaOpcodeDescription(enum PXGFragmentAlphaOpcode)"];
                int32x4_t v20 = v18;
                float32x4_t v21 = v19;
                uint64_t v22 = 703;
                goto LABEL_24;
              default:
                float32x4_t v18 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", 0);
                long long v19 = [NSString stringWithUTF8String:"NSString *PXGFragmentAlphaOpcodeDescription(enum PXGFragmentAlphaOpcode)"];
                int32x4_t v20 = v18;
                float32x4_t v21 = v19;
                uint64_t v22 = 705;
                goto LABEL_24;
            }
          case 6u:
            float32x4_t v18 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", 0);
            long long v19 = [NSString stringWithUTF8String:"NSString *PXGFragmentColorOpcodeDescription(enum PXGFragmentColorOpcode)"];
            int32x4_t v20 = v18;
            float32x4_t v21 = v19;
            uint64_t v22 = 689;
            break;
          default:
            float32x4_t v18 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", 0);
            long long v19 = [NSString stringWithUTF8String:"NSString *PXGFragmentColorOpcodeDescription(enum PXGFragmentColorOpcode)"];
            int32x4_t v20 = v18;
            float32x4_t v21 = v19;
            uint64_t v22 = 691;
            break;
        }
        break;
      case 3u:
        float32x4_t v18 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", 0);
        long long v19 = [NSString stringWithUTF8String:"NSString *PXGTextureCoordinateOpcodeDescription(enum PXGTextureCoordinateOpcode)"];
        int32x4_t v20 = v18;
        float32x4_t v21 = v19;
        uint64_t v22 = 669;
        break;
      default:
        float32x4_t v18 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", 0);
        long long v19 = [NSString stringWithUTF8String:"NSString *PXGTextureCoordinateOpcodeDescription(enum PXGTextureCoordinateOpcode)"];
        int32x4_t v20 = v18;
        float32x4_t v21 = v19;
        uint64_t v22 = 671;
        break;
    }
    break;
  }
LABEL_24:
  [v20 handleFailureInFunction:v21 file:@"PXGTypes.m" lineNumber:v22 description:@"Code which should be unreachable has been reached"];

  abort();
}

uint64_t PXGYCbCrMatrixIsVideoRange(unsigned int a1)
{
  if (a1 > 9) {
    return 0;
  }
  char v3 = a1;
  uint64_t result = 1;
  if (((1 << v3) & 0x155) != 0) {
    return 0;
  }
  if (((1 << v3) & 0xAA) == 0)
  {
    uint64_t v7 = v1;
    uint64_t v8 = v2;
    id v5 = PXAssertGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_26039F000, v5, OS_LOG_TYPE_ERROR, "Invalid to ask for IsVideoRange for PXGYCbCr_Count", v6, 2u);
    }

    return 0;
  }
  return result;
}

void sub_2603BA0F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2603BB0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2603BB6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2603BC28C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PXGSpriteInfoDescription(unsigned __int8 *a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"{"];
  uint64_t v3 = *a1;
  if (*a1)
  {
    if (v3 > 2) {
      unint64_t v4 = @"unexpected";
    }
    else {
      unint64_t v4 = off_265556890[v3];
    }
    id v5 = v4;
    [v2 appendFormat:@"presentationType=%@, ", v5];
  }
  uint64_t v6 = a1[1];
  if (a1[1])
  {
    if (v6 > 0xD) {
      uint64_t v7 = @"unexpected";
    }
    else {
      uint64_t v7 = off_2655568A8[v6];
    }
    uint64_t v8 = v7;
    [v2 appendFormat:@"mediaKind=%@, ", v8];
  }
  uint64_t v9 = *((void *)a1 + 1);
  if (*(float *)&v9 != 0.0 || *((float *)&v9 + 1) != 0.0)
  {
    id v10 = [NSString stringWithFormat:@"{%.2f, %.2f}", *(float *)&v9, *((float *)&v9 + 1)];
    [v2 appendFormat:@"mediaTargetSize=%@, ", v10];
  }
  float v11 = *((float *)a1 + 4);
  if (v11 != 0.0) {
    [v2 appendFormat:@"mediaAspectRatio=%.2f, ", v11];
  }
  if (*((void *)a1 + 3)) {
    [v2 appendFormat:@"tag:0x%llx (%d, %d, %d, %d), ", *((void *)a1 + 3), BYTE1(*((void *)a1 + 3)), *((void *)a1 + 3), WORD1(*((void *)a1 + 3)), HIDWORD(*((void *)a1 + 3))];
  }
  if (*((_WORD *)a1 + 16)) {
    [v2 appendFormat:@"mediaVersion=%d, ", *((unsigned __int16 *)a1 + 16)];
  }
  if (a1[34])
  {
    double v12 = PXGSpriteInfoFlagsDescription(a1[34]);
    [v2 appendFormat:@"flags=%@, ", v12];
  }
  objc_msgSend(v2, "px_removeSuffix:", @", ");
  [v2 appendString:@"}"];

  return v2;
}

void sub_2603BDA70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 216), 8);
  _Block_object_dispose((const void *)(v40 - 168), 8);
  _Block_object_dispose((const void *)(v40 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2401(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2402(uint64_t a1)
{
}

void sub_2603BE4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t PXGSectionedSpriteTagDecompose(unint64_t result, unsigned __int8 a2, unsigned char *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v5 = HIDWORD(result);
  if (HIDWORD(result) == 0xFFFFFFFF) {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a2 == BYTE1(result)) {
    uint64_t v6 = WORD1(result);
  }
  else {
    uint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a2 != BYTE1(result)) {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (a3) {
    *a3 = result;
  }
  if (a4) {
    *a4 = v6;
  }
  if (a5) {
    *a5 = v5;
  }
  return result;
}

uint64_t PXGSectionedSpriteTagGetDataSourceIdentifierHash(__int16 a1)
{
  return HIBYTE(a1);
}

__n128 PXGSectionedSpriteTagGetIndexPath@<Q0>(unint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (a2 == BYTE1(a1))
  {
    *a3 = a2;
    a3[1] = WORD1(a1);
    if (HIDWORD(a1) == 0xFFFFFFFF) {
      uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v3 = HIDWORD(a1);
    }
    a3[2] = v3;
    a3[3] = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    __n128 result = *(__n128 *)MEMORY[0x263F5E398];
    long long v5 = *(_OWORD *)(MEMORY[0x263F5E398] + 16);
    *(_OWORD *)a3 = *MEMORY[0x263F5E398];
    *((_OWORD *)a3 + 1) = v5;
  }
  return result;
}

uint64_t PXGSectionedSpriteTagDescription(unint64_t a1)
{
  return [NSString stringWithFormat:@"0x%llx (%d, %d, %d, %d)", a1, BYTE1(a1), a1, WORD1(a1), HIDWORD(a1)];
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x270EE4A48](cf);
}

void CFRelease(CFTypeRef cf)
{
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x270EE5970](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C0](retstr, t, angle);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x270EE59F8](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x270EE5B50](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x270EE5B60](a1, *(void *)&intent, color, options);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x270EE5B88](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x270EE5BC8](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x270EE5BD0](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x270EE5BE0](color);
}

void CGColorRelease(CGColorRef color)
{
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x270EE5CC0]();
}

uint64_t CGColorSpaceEqualToColorSpaceIgnoringRange()
{
  return MEMORY[0x270EE5CC8]();
}

uint64_t CGColorSpaceGetAlternateColorSpace()
{
  return MEMORY[0x270EE5CD0]();
}

CFStringRef CGColorSpaceGetName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x270EE5D10](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x270EE5D28]();
}

uint64_t CGColorSpaceIsUncalibrated()
{
  return MEMORY[0x270EE5D50]();
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x270EE5D70](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextResetClip(CGContextRef c)
{
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

CFDataRef CGDataProviderCopyData(CGDataProviderRef provider)
{
  return (CFDataRef)MEMORY[0x270EE62B8](provider);
}

uint64_t CGDataProviderReleaseBytePtr()
{
  return MEMORY[0x270EE6320]();
}

uint64_t CGDataProviderRetainBytePtr()
{
  return MEMORY[0x270EE6328]();
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x270EE6778](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x270EE6780](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x270EE6790](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x270EE67A0](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x270EE67C0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x270EE67D8](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x270EE67E8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x270EE6800](image);
}

uint64_t CGImageGetImageProvider()
{
  return MEMORY[0x270EE6810]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x270EE6868](image);
}

uint64_t CGImageProviderCopyImageTextureData()
{
  return MEMORY[0x270EE68A8]();
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x270EE6908](image);
}

uint64_t CGImageTextureDataGetDataWithBlock()
{
  return MEMORY[0x270EE6920]();
}

uint64_t CGImageTextureDataGetPixelFormat()
{
  return MEMORY[0x270EE6930]();
}

uint64_t CGImageTextureDataGetSize()
{
  return MEMORY[0x270EE6938]();
}

uint64_t CGImageTextureDataRelease()
{
  return MEMORY[0x270EE6940]();
}

uint64_t CGImageTextureDataSupportsTiledLayout()
{
  return MEMORY[0x270EE6950]();
}

BOOL CGPathEqualToPath(CGPathRef path1, CGPathRef path2)
{
  return MEMORY[0x270EE7068](path1, path2);
}

void CGPathRelease(CGPathRef path)
{
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x270EE7108](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x270EE7168](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.width = v4;
  result.origin.CGFloat y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x270EE71C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x270EE71D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7290]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.width = v4;
  result.origin.CGFloat y = v3;
  result.origin.x = v2;
  return result;
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x270EE9FC0](buffer, key, attachmentMode);
}

void CVBufferRelease(CVBufferRef buffer)
{
}

CVReturn CVMetalTextureCacheCreateTextureFromImage(CFAllocatorRef allocator, CVMetalTextureCacheRef textureCache, CVImageBufferRef sourceImage, CFDictionaryRef textureAttributes, MTLPixelFormat pixelFormat, size_t width, size_t height, size_t planeIndex, CVMetalTextureRef *textureOut)
{
  return MEMORY[0x270EEA0F0](allocator, textureCache, sourceImage, textureAttributes, pixelFormat, width, height, planeIndex);
}

void CVMetalTextureCacheFlush(CVMetalTextureCacheRef textureCache, CVOptionFlags options)
{
}

id CVMetalTextureGetTexture(CVMetalTextureRef image)
{
  return (id)MEMORY[0x270EEA110](image);
}

uint64_t CVPixelBufferGetAttributes()
{
  return MEMORY[0x270EEA188]();
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA1F8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x270EEA200](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA218](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x270EEA220](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x270EEA250](pixelBuffer, planeIndex);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x270EEA320](texture);
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x270EF4C00](property, value);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x270EF4C90]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D48](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4D58](buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D88](buffer);
}

size_t IOSurfaceGetPropertyMaximum(CFStringRef property)
{
  return MEMORY[0x270EF4D98](property);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4DE0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4DF0](buffer, planeIndex);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x270F96018]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x270F82BB8](transform);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x270F82BD0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t PFMap()
{
  return MEMORY[0x270F53680]();
}

uint64_t PXAssertGetLog()
{
  return MEMORY[0x270F53FA8]();
}

uint64_t PXCreateCGImageWithDrawBlock()
{
  return MEMORY[0x270F53FC8]();
}

uint64_t PXCreateContext()
{
  return MEMORY[0x270F53FD0]();
}

uint64_t PXCreateMutableIntegerArrayRef()
{
  return MEMORY[0x270F53FE0]();
}

uint64_t PXFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x270F53FF0]();
}

uint64_t PXFloatByLinearlyInterpolatingFloats()
{
  return MEMORY[0x270F54000]();
}

uint64_t PXFloatRoundToPixel()
{
  return MEMORY[0x270F54008]();
}

uint64_t PXGetColorSpace()
{
  return MEMORY[0x270F54030]();
}

uint64_t PXMap()
{
  return MEMORY[0x270F54040]();
}

uint64_t PXRectEdgeValue()
{
  return MEMORY[0x270F54060]();
}

uint64_t PXRectGetCenter()
{
  return MEMORY[0x270F54068]();
}

uint64_t PXRectRoundToPixel()
{
  return MEMORY[0x270F54080]();
}

uint64_t PXRectWithAspectRatioFillingRect()
{
  return MEMORY[0x270F54090]();
}

uint64_t PXRectWithCenterAndSize()
{
  return MEMORY[0x270F540A0]();
}

uint64_t PXSizeGetAspectRatio()
{
  return MEMORY[0x270F540B8]();
}

uint64_t PXSizeGetAspectRatioWithDefault()
{
  return MEMORY[0x270F540C0]();
}

uint64_t PXSizeIsEmpty()
{
  return MEMORY[0x270F540C8]();
}

uint64_t PXSizeLargerThanSize()
{
  return MEMORY[0x270F540D0]();
}

uint64_t PXSizeMin()
{
  return MEMORY[0x270F540D8]();
}

uint64_t PXSizeScale()
{
  return MEMORY[0x270F540E0]();
}

uint64_t PXSizeWithAspectRatioFittingSize()
{
  return MEMORY[0x270F540F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double exp2(long double __x)
{
  MEMORY[0x270ED9860](__x);
  return result;
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}