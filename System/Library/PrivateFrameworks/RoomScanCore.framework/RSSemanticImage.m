@interface RSSemanticImage
- (BOOL)isEqual:(id)a3;
- (RSSemanticImage)init;
- (void)dealloc;
@end

@implementation RSSemanticImage

- (BOOL)isEqual:(id)a3
{
  v4 = (RSSemanticImage *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        v7 = v6;
        if (!self)
        {
LABEL_65:

          goto LABEL_66;
        }
        if (self->_width == v6->_width && self->_height == v6->_height && self->_channel == v6->_channel)
        {
          BOOL v8 = self->_backingType == 1 && CVPixelBufferLockBaseAddress(self->_backing.pixelBuffer, 1uLL) == 0;
          unsigned int dataType = self->_dataType;
          if (dataType == 1278226536)
          {
            unsigned int v19 = v7->_dataType;
            if (v19 == 1278226536)
            {
              if (self->_channel)
              {
                unint64_t v44 = 0;
                while (1)
                {
                  v45 = sub_25B4FD95C(self, v44);
                  v46 = sub_25B4FD95C(v7, v44);
                  unint64_t height = self->_height;
                  if (height) {
                    break;
                  }
LABEL_61:
                  if (++v44 >= self->_channel) {
                    goto LABEL_62;
                  }
                }
                uint64_t v48 = 0;
                while (!self->_width)
                {
LABEL_60:
                  if (++v48 == height) {
                    goto LABEL_61;
                  }
                }
                v49 = (__int16 *)((char *)v45 + self->_bytesPerRow * v48);
                unint64_t width = self->_width;
                v51 = (__int16 *)((char *)v46 + v7->_bytesPerRow * v48);
                while (1)
                {
                  _H0 = *v49;
                  __asm { FCVT            S0, H0 }
                  _H1 = *v51;
                  __asm { FCVT            S1, H1 }
                  if (vabds_f32(_S0, _S1) > 0.000001) {
                    goto LABEL_64;
                  }
                  ++v51;
                  ++v49;
                  if (!--width) {
                    goto LABEL_60;
                  }
                }
              }
            }
            else if (v19 == 1278226534 && self->_channel)
            {
              unint64_t v20 = 0;
              while (1)
              {
                v21 = sub_25B4FD95C(self, v20);
                v22 = sub_25B4FD95C(v7, v20);
                unint64_t v23 = self->_height;
                if (v23) {
                  break;
                }
LABEL_39:
                if (++v20 >= self->_channel) {
                  goto LABEL_62;
                }
              }
              uint64_t v24 = 0;
              while (!self->_width)
              {
LABEL_38:
                if (++v24 == v23) {
                  goto LABEL_39;
                }
              }
              v25 = (__int16 *)((char *)v21 + self->_bytesPerRow * v24);
              unint64_t v26 = self->_width;
              v27 = (float *)((char *)v22 + v7->_bytesPerRow * v24);
              while (1)
              {
                _H0 = *v25;
                __asm { FCVT            S0, H0 }
                if (vabds_f32(_S0, *v27) > 0.000001) {
                  goto LABEL_64;
                }
                ++v27;
                ++v25;
                if (!--v26) {
                  goto LABEL_38;
                }
              }
            }
          }
          else if (dataType == 1278226534)
          {
            unsigned int v10 = v7->_dataType;
            if (v10 == 1278226536)
            {
              if (self->_channel)
              {
                unint64_t v34 = 0;
                while (1)
                {
                  v35 = sub_25B4FD95C(self, v34);
                  v36 = sub_25B4FD95C(v7, v34);
                  unint64_t v37 = self->_height;
                  if (v37) {
                    break;
                  }
LABEL_50:
                  if (++v34 >= self->_channel) {
                    goto LABEL_62;
                  }
                }
                uint64_t v38 = 0;
                while (!self->_width)
                {
LABEL_49:
                  if (++v38 == v37) {
                    goto LABEL_50;
                  }
                }
                v39 = (float *)((char *)v35 + self->_bytesPerRow * v38);
                unint64_t v40 = self->_width;
                v41 = (__int16 *)((char *)v36 + v7->_bytesPerRow * v38);
                while (1)
                {
                  _H0 = *v41;
                  __asm { FCVT            S0, H0 }
                  if (vabds_f32(*v39, _S0) > 0.000001) {
                    goto LABEL_64;
                  }
                  ++v41;
                  ++v39;
                  if (!--v40) {
                    goto LABEL_49;
                  }
                }
              }
            }
            else if (v10 == 1278226534 && self->_channel)
            {
              unint64_t v11 = 0;
              while (1)
              {
                v12 = sub_25B4FD95C(self, v11);
                v13 = sub_25B4FD95C(v7, v11);
                unint64_t v14 = self->_height;
                if (v14) {
                  break;
                }
LABEL_26:
                if (++v11 >= self->_channel) {
                  goto LABEL_62;
                }
              }
              uint64_t v15 = 0;
              while (!self->_width)
              {
LABEL_25:
                if (++v15 == v14) {
                  goto LABEL_26;
                }
              }
              v16 = (float *)((char *)v12 + self->_bytesPerRow * v15);
              unint64_t v17 = self->_width;
              v18 = (float *)((char *)v13 + v7->_bytesPerRow * v15);
              while (vabds_f32(*v16, *v18) <= 0.000001)
              {
                ++v18;
                ++v16;
                if (!--v17) {
                  goto LABEL_25;
                }
              }
              goto LABEL_64;
            }
          }
LABEL_62:
          if (v8)
          {
            memoryBuffer = self->_backing.memoryBuffer;
            LOBYTE(self) = 1;
            CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)memoryBuffer, 1uLL);
          }
          else
          {
            LOBYTE(self) = 1;
          }
          goto LABEL_65;
        }
LABEL_64:
        LOBYTE(self) = 0;
        goto LABEL_65;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_66:

  return (char)self;
}

- (void)dealloc
{
  sub_25B4FDAAC((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)RSSemanticImage;
  [(RSSemanticImage *)&v3 dealloc];
}

- (RSSemanticImage)init
{
  if (self) {
    return (RSSemanticImage *)sub_25B4FDB1C(self, 0, 0, 0, 0, 1278226534);
  }
  return self;
}

@end