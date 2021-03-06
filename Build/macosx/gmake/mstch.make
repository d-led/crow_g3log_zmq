# GNU Make project makefile autogenerated by Premake

ifndef config
  config=debug_x32
endif

ifndef verbose
  SILENT = @
endif

.PHONY: clean prebuild prelink

ifeq ($(config),debug_x32)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x32/Debug
  TARGET = $(TARGETDIR)/libmstch.a
  OBJDIR = ../../../obj/macosx/gmake/x32/Debug/mstch
  DEFINES += -DPICOJSON_USE_INT64 -D_DEBUG
  INCLUDES += -I/usr/local/Cellar/zeromq/4.1.4/include -I/usr/local/include -I../../../deps/cppzmq -I../../../deps/crow/include -I../../../deps/crow/amalgamate -I../../../deps/mstch/include -I../../../deps/mstch/src -I../../../deps/spdlog/include -I../../../deps/picojson -I../../../deps/picojson_serializer
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -g -std=c++11
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -L/usr/local/Cellar/zeromq/4.1.4/lib -L/usr/local/lib -m32
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),debug_x64)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x64/Debug
  TARGET = $(TARGETDIR)/libmstch.a
  OBJDIR = ../../../obj/macosx/gmake/x64/Debug/mstch
  DEFINES += -DPICOJSON_USE_INT64 -D_DEBUG
  INCLUDES += -I/usr/local/Cellar/zeromq/4.1.4/include -I/usr/local/include -I../../../deps/cppzmq -I../../../deps/crow/include -I../../../deps/crow/amalgamate -I../../../deps/mstch/include -I../../../deps/mstch/src -I../../../deps/spdlog/include -I../../../deps/picojson -I../../../deps/picojson_serializer
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -g -std=c++11
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -L/usr/local/Cellar/zeromq/4.1.4/lib -L/usr/local/lib -m64
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x32)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x32/Release
  TARGET = $(TARGETDIR)/libmstch.a
  OBJDIR = ../../../obj/macosx/gmake/x32/Release/mstch
  DEFINES += -DPICOJSON_USE_INT64
  INCLUDES += -I/usr/local/Cellar/zeromq/4.1.4/include -I/usr/local/include -I../../../deps/cppzmq -I../../../deps/crow/include -I../../../deps/crow/amalgamate -I../../../deps/mstch/include -I../../../deps/mstch/src -I../../../deps/spdlog/include -I../../../deps/picojson -I../../../deps/picojson_serializer
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m32 -O2 -std=c++11
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib32 -L/usr/local/Cellar/zeromq/4.1.4/lib -L/usr/local/lib -m32 -Wl,-x
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

ifeq ($(config),release_x64)
  RESCOMP = windres
  TARGETDIR = ../../../bin/macosx/gmake/x64/Release
  TARGET = $(TARGETDIR)/libmstch.a
  OBJDIR = ../../../obj/macosx/gmake/x64/Release/mstch
  DEFINES += -DPICOJSON_USE_INT64
  INCLUDES += -I/usr/local/Cellar/zeromq/4.1.4/include -I/usr/local/include -I../../../deps/cppzmq -I../../../deps/crow/include -I../../../deps/crow/amalgamate -I../../../deps/mstch/include -I../../../deps/mstch/src -I../../../deps/spdlog/include -I../../../deps/picojson -I../../../deps/picojson_serializer
  FORCE_INCLUDE +=
  ALL_CPPFLAGS += $(CPPFLAGS) -MMD -MP $(DEFINES) $(INCLUDES)
  ALL_CFLAGS += $(CFLAGS) $(ALL_CPPFLAGS) -m64 -O2 -std=c++11
  ALL_CXXFLAGS += $(CXXFLAGS) $(ALL_CFLAGS)
  ALL_RESFLAGS += $(RESFLAGS) $(DEFINES) $(INCLUDES)
  LIBS +=
  LDDEPS +=
  ALL_LDFLAGS += $(LDFLAGS) -L/usr/lib64 -L/usr/local/Cellar/zeromq/4.1.4/lib -L/usr/local/lib -m64 -Wl,-x
  LINKCMD = $(AR) -rcs "$@" $(OBJECTS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

endif

OBJECTS := \
	$(OBJDIR)/mstch.o \
	$(OBJDIR)/render_context.o \
	$(OBJDIR)/in_section.o \
	$(OBJDIR)/outside_section.o \
	$(OBJDIR)/template_type.o \
	$(OBJDIR)/token.o \
	$(OBJDIR)/utils.o \

RESOURCES := \

CUSTOMFILES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES) ${CUSTOMFILES}
	@echo Linking mstch
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning mstch
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(OBJECTS): $(GCH) $(PCH)
$(GCH): $(PCH)
	@echo $(notdir $<)
	$(SILENT) $(CXX) -x c++-header $(ALL_CXXFLAGS) -o "$@" -MF "$(@:%.gch=%.d)" -c "$<"
endif

$(OBJDIR)/mstch.o: ../../../deps/mstch/src/mstch.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/render_context.o: ../../../deps/mstch/src/render_context.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/in_section.o: ../../../deps/mstch/src/state/in_section.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/outside_section.o: ../../../deps/mstch/src/state/outside_section.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/template_type.o: ../../../deps/mstch/src/template_type.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/token.o: ../../../deps/mstch/src/token.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"
$(OBJDIR)/utils.o: ../../../deps/mstch/src/utils.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(ALL_CXXFLAGS) $(FORCE_INCLUDE) -o "$@" -MF "$(@:%.o=%.d)" -c "$<"

-include $(OBJECTS:%.o=%.d)
ifneq (,$(PCH))
  -include $(OBJDIR)/$(notdir $(PCH)).d
endif
